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
    UIImageView* tableViewBackground = [[UIImageView alloc] initWithImage:[UIImage getImageWithFileName:@"di"]];
    [shopTableViewController.tableView setBackgroundView:tableViewBackground];
    [tableViewBackground release];
    [shopTableViewController.tableView setFrame:CGRectMake(0, normalImage.size.height, FULL_WIDTH, FULL_HEIGHT - normalImage.size.height - 20)];
    [self.view addSubview:shopTableViewController.view];
    
    killometerView = [[KilometerView alloc] initWithFrame:CGRectMake(0, -125, FULL_WIDTH, 123)];
    [self.view addSubview:killometerView];
    
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
        [imageURL thumbImage:@"http://ww3.sinaimg.cn/bmiddle/8a356118gw1e28wre1bigj.jpg"];
        [imageURL middleImage:@"http://192.168.3.108/ceshi.jpg"];
        [imageURL originImage:@"http://192.168.3.108/ceshi.jpg"];
        
        [shopInfo imageURL:imageURL];
        [imageURL release];
        imageURL = nil;
        
        [shopList addObject:shopInfo];
    }
}

- (void)addAlphaBlack
{
    if (alphaBlack == nil) {
        alphaBlack = [[UIView alloc] initWithFrame:shopTableViewController.view.frame];
        alphaBlack.backgroundColor = [UIColor blackColor];
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
    recommandButton.selected = !recommandButton.selected;
}

- (void)tasteButtonPressed:(id)sender
{
    tasteButton.selected = !tasteButton.selected;
}

- (void)distanceButtonPressed:(id)sender
{
    distanceButton.selected = !distanceButton.selected;
    if (distanceButton.selected) {
        [self addAlphaBlack];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [killometerView setFrame:CGRectMake(0, distanceButton.frame.size.height - 12, FULL_WIDTH, 123)];
        [UIView commitAnimations];
    }else{
        [alphaBlack removeFromSuperview];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [killometerView setFrame:CGRectMake(0, -125, FULL_WIDTH, 123)];
        [UIView commitAnimations];
    }
}

- (void)scrollToTop
{
    [shopTableViewController.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d>>>>>>", indexPath.row);
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
