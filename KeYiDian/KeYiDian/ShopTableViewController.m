//
//  ShopTableViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-22.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShopTableViewController.h"
#import "KilometerView.h"
#import "UIImage+Extensions.h"
#import "Global.h"
#import "Definitions.h"
#import "RefreshTableViewController.h"
#import "CurrentLocationViewController.h"
#import "UITouchableView.h"

#import "ShopInfo.h"
#import "ImageURL.h"
#import "ShopLikeTableViewCell.h"

@interface ShopTableViewController ()

@end

@implementation ShopTableViewController

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage* normalImage = [UIImage getImageWithFileName:@"lvdaohang0"];
    UIImage* selectedImage = [UIImage getImageWithFileName:@"lvdaohang1"];
    distanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [distanceButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [distanceButton setBackgroundImage:normalImage forState:UIControlStateHighlighted];
    [distanceButton setBackgroundImage:selectedImage forState:UIControlStateSelected];
    [distanceButton setFrame:CGRectMake(0, 0, normalImage.size.width, normalImage.size.height)];
    [distanceButton setTitle:@"距离" forState:UIControlStateNormal];
    [distanceButton setTitle:@"距离" forState:UIControlStateHighlighted];
    [distanceButton setTitle:@"距离" forState:UIControlStateSelected];
    [distanceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [distanceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [distanceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    distanceButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    [self.view addSubview:distanceButton];
    [distanceButton addTarget:self action:@selector(distanceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    tasteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tasteButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [tasteButton setBackgroundImage:normalImage forState:UIControlStateHighlighted];
    [tasteButton setBackgroundImage:selectedImage forState:UIControlStateSelected];
    [tasteButton setFrame:CGRectMake(normalImage.size.width, 0, normalImage.size.width, normalImage.size.height)];
    [tasteButton setTitle:@"口味" forState:UIControlStateNormal];
    [tasteButton setTitle:@"口味" forState:UIControlStateHighlighted];
    [tasteButton setTitle:@"口味" forState:UIControlStateSelected];
    [tasteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tasteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [tasteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    tasteButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    [self.view addSubview:tasteButton];
    [tasteButton addTarget:self action:@selector(tasteButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    recommandButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [recommandButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [recommandButton setBackgroundImage:normalImage forState:UIControlStateHighlighted];
    [recommandButton setBackgroundImage:selectedImage forState:UIControlStateSelected];
    [recommandButton setFrame:CGRectMake(normalImage.size.width * 2, 0, normalImage.size.width, normalImage.size.height)];
    [recommandButton setTitle:@"推荐" forState:UIControlStateNormal];
    [recommandButton setTitle:@"推荐" forState:UIControlStateHighlighted];
    [recommandButton setTitle:@"推荐" forState:UIControlStateSelected];
    [recommandButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [recommandButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [recommandButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    recommandButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    [self.view addSubview:recommandButton];
    [recommandButton addTarget:self action:@selector(recommandButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    shopTableViewController = [[RefreshTableViewController alloc] initWithStyle:UITableViewStylePlain];
    shopTableViewController.tableView.backgroundColor = [UIColor clearColor];
    shopTableViewController.tableView.dataSource = self;
    shopTableViewController.tableView.delegate = self;
    shopTableViewController.tableView.showsVerticalScrollIndicator = NO;
    shopTableViewController.refreshDelegate = self;
    shopTableViewController.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage getImageWithFileName:@"shouyedi"]];
    [shopTableViewController.tableView setFrame:CGRectMake(0, normalImage.size.height, FULL_WIDTH, FULL_HEIGHT - normalImage.size.height - 60)];
    [self.view addSubview:shopTableViewController.view];
    
    killometerView = [[KilometerView alloc] initWithFrame:CGRectMake(0, -125, FULL_WIDTH, 123)];
    [self.view addSubview:killometerView];
    
    currentLocationViewController = [[CurrentLocationViewController alloc] init];
    [currentLocationViewController.view setFrame:CGRectMake(0, self.view.frame.size.height - 84, self.view.frame.size.width, 40)];
    [self.view addSubview:currentLocationViewController.view];
    
    shopList = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 100; i++) {
        ShopInfo* shopInfo = [[ShopInfo alloc] init];
        shopInfo.shopName = @"测试店名";
        shopInfo.shopType = 1;
        shopInfo.starNum = 3;
        shopInfo.commentNum = 200;
        shopInfo.distance = 200;
        shopInfo.isZhao = NO;
        shopInfo.isXin = NO;
        shopInfo.isTe = NO;
        shopInfo.isDuo = NO;
        
        ImageURL* imageURL = [[ImageURL alloc] init];
        [imageURL thumbImage:@"http://ww2.sinaimg.cn/bmiddle/62eeaba5jw1e2ih6qvjvfj.jpg"];
        [imageURL middleImage:@"http://ww2.sinaimg.cn/bmiddle/62eeaba5jw1e2ih6qvjvfj.jpg"];
        [imageURL originImage:@"http://ww2.sinaimg.cn/bmiddle/62eeaba5jw1e2ih6qvjvfj.jpg"];
        
        [shopInfo imageURL:imageURL];
        [imageURL release];
        imageURL = nil;
        
        [shopList addObject:shopInfo];
    }
}

- (void)touchUpInside:(UIView*)view
{
    [self resetWidget];
}

- (void)addAlphaBlack
{
    if (alphaBlack == nil) {
        alphaBlack = [[UITouchableView alloc] initWithFrame:shopTableViewController.view.frame];
        alphaBlack.delegate = self;
        alphaBlack.backgroundColor = [UIColor blackColor];
    }
    if (alphaBlack.superview) {
        return;
    }
    alphaBlack.alpha = 0;
    [self.view insertSubview:alphaBlack aboveSubview:shopTableViewController.view];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    alphaBlack.alpha = 0.5;
    [UIView commitAnimations];
}

- (void)recommandButtonPressed:(id)sender
{
    [self resetCategory:recommandButton];
    recommandButton.selected = !recommandButton.selected;
    if (recommandButton.selected) {
        if(alphaBlack) [alphaBlack removeFromSuperview];
        currentButton = recommandButton;
    }
}

- (void)tasteButtonPressed:(id)sender
{
    [self resetCategory:tasteButton];
    tasteButton.selected = !tasteButton.selected;
    if (tasteButton.selected) {
        [self addAlphaBlack];
        currentButton = tasteButton;
    }
}

- (void)distanceButtonPressed:(id)sender
{
    [self resetCategory:distanceButton];
    distanceButton.selected = !distanceButton.selected;
    if (distanceButton.selected) {
        [self addAlphaBlack];
        currentButton = distanceButton;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [killometerView setFrame:CGRectMake(0, distanceButton.frame.size.height - 12, FULL_WIDTH, 123)];
        [UIView commitAnimations];
    }
}

- (void)resetWidget
{
    if (currentButton) {
        BOOL isRecommand = NO;
        if (currentButton != recommandButton) {
            currentButton.selected = NO;
        }else{
            isRecommand = YES;
        }
        [self resetCategory:currentButton];
        if (isRecommand) {
            currentButton = recommandButton;
        }
    }
}

- (void)resetCategory:(UIButton*)btn
{
    if (currentButton) {
        if (currentButton == distanceButton) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.3];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [killometerView setFrame:CGRectMake(0, -125, FULL_WIDTH, 123)];
            [UIView commitAnimations];
        }else if(currentButton == tasteButton){
            
        }else if(currentButton == recommandButton){
            
        }
        if (btn != currentButton) {
            currentButton.selected = NO;
        }else{
            if(alphaBlack) [alphaBlack removeFromSuperview];
        }
        currentButton = nil;
    }
}

- (void)scrollToTop
{
    [shopTableViewController.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [shopTableViewController release];
    [killometerView release];
    if (alphaBlack) {
        [alphaBlack release];
    }
    if (shopList) {
        [shopList removeAllObjects];
        [shopList release];
    }
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDelegate UITableViewDataSource delegate functions
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* shopCell = @"ShopCell";
    
    ShopLikeTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:shopCell];
    if (cell == nil) {
        cell = [[[ShopLikeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shopCell info:[shopList objectAtIndex:indexPath.row]] autorelease];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma RefreshTableViewController delegate function
- (void)reloadData
{
    [shopTableViewController performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:0.3];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [shopTableViewController scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [shopTableViewController scrollViewDidEndDragging];
}

@end
