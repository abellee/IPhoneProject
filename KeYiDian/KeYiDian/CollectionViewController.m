//
//  CollectionViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "CollectionViewController.h"
#import "UIImage+Extensions.h"
#import "RefreshTableViewController.h"
#import "ShopLikeTableViewCell.h"
#import "Global.h"
#import "ShopInfo.h"
#import "ImageURL.h"
#import "Utility.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (id)init
{
    if (self = [super init]) {
        title = @"我的收藏";
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImage* foodBtnNormal = [UIImage getImageWithFileName:@"ss_bai01"];
    UIImage* foodBtnSelected = [UIImage getImageWithFileName:@"ss_lv01"];
    
    UIImage* shopBtnNormal = [UIImage getImageWithFileName:@"ss_bai02"];
    UIImage* shopBtnSelected = [UIImage getImageWithFileName:@"ss_lv02"];
    
    float totalWidth = foodBtnNormal.size.width + shopBtnNormal.size.width;
    float leftPosX = (self.view.frame.size.width - totalWidth) / 2;
    
    foodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [foodBtn setBackgroundImage:foodBtnNormal forState:UIControlStateNormal];
    [foodBtn setBackgroundImage:foodBtnNormal forState:UIControlStateHighlighted];
    [foodBtn setBackgroundImage:foodBtnSelected forState:UIControlStateSelected];
    [foodBtn setBackgroundImage:foodBtnSelected forState:UIControlStateSelected | UIControlStateHighlighted];
    [foodBtn setTitle:@"我爱美食" forState:UIControlStateNormal];
    [foodBtn setTitle:@"我爱美食" forState:UIControlStateSelected];
    [foodBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [foodBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [foodBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected | UIControlStateHighlighted];
    [foodBtn setFrame:CGRectMake(leftPosX, 10, foodBtnNormal.size.width, foodBtnNormal.size.height)];
    [foodBtn addTarget:self action:@selector(foodBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    shopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shopBtn setBackgroundImage:shopBtnNormal forState:UIControlStateNormal];
    [shopBtn setBackgroundImage:shopBtnNormal forState:UIControlStateHighlighted];
    [shopBtn setBackgroundImage:shopBtnSelected forState:UIControlStateSelected];
    [shopBtn setBackgroundImage:shopBtnSelected forState:UIControlStateSelected | UIControlStateHighlighted];
    [shopBtn setTitle:@"我的餐厅" forState:UIControlStateNormal];
    [shopBtn setTitle:@"我的餐厅" forState:UIControlStateSelected];
    [shopBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [shopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [shopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected | UIControlStateHighlighted];
    [shopBtn setFrame:CGRectMake(foodBtn.frame.origin.x + foodBtn.frame.size.width, 10, shopBtnNormal.size.width, shopBtnNormal.size.height)];
    [shopBtn addTarget:self action:@selector(shopBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:foodBtn];
    [self.view addSubview:shopBtn];
    
    resultTableViewController = [[RefreshTableViewController alloc] initWithStyle:UITableViewStylePlain];
    resultTableViewController.tableView.dataSource = self;
    resultTableViewController.tableView.delegate = self;
    resultTableViewController.refreshDelegate = self;
    resultTableViewController.view.backgroundColor = [UIColor clearColor];
    resultTableViewController.tableView.backgroundView = nil;
    [resultTableViewController.view setFrame:CGRectMake(0, foodBtn.frame.size.height + 20, self.view.frame.size.width, self.view.frame.size.height - foodBtn.frame.size.height - 20)];
    [self.view addSubview:resultTableViewController.view];
    resultTableViewController.view.hidden = YES;
    
    noticeLabel = [[UILabel alloc] init];
    noticeLabel.backgroundColor = [UIColor clearColor];
    [noticeLabel setTextColor:[UIColor grayColor]];
    [noticeLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.view addSubview:noticeLabel];
    
    
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
        
        [[Global sharedInstance] addFoodToCollectionList:shopInfo];
    }
    
    shopBtn.selected = YES;
    curStatus = SHOP;
    [self checkData];
}

- (void)shopBtnPressed:(id)sender
{
    shopBtn.selected = YES;
    foodBtn.selected = NO;
    curStatus = SHOP;
    [self checkData];
}

- (void)foodBtnPressed:(id)sender
{
    foodBtn.selected = YES;
    shopBtn.selected = NO;
    curStatus = FOOD;
    [self checkData];
}

- (void)checkData
{
    NSString* noticeStr = @"暂无收藏任何餐厅";
    if (curStatus == SHOP) {
        if ([[[Global sharedInstance] shopCollectionList] count] > 0) {
            noticeLabel.hidden = YES;
            resultTableViewController.view.hidden = NO;
            [self reloadTableViewData];
            return;
        }else{
            noticeStr = @"暂无收藏任何餐厅";
        }
    }else{
        if ([[[Global sharedInstance] foodCollectionList] count] > 0) {
            noticeLabel.hidden = YES;
            resultTableViewController.view.hidden = NO;
            [self reloadTableViewData];
            return;
        }else{
            noticeStr = @"暂无收藏任何美食";
        }
    }
    noticeLabel.hidden = NO;
    resultTableViewController.view.hidden = YES;
    CGSize noticeStrSize = [Utility getCGSizeWithFontSize:14.0 str:noticeStr isBold:NO];
    [noticeLabel setText:noticeStr];
    [noticeLabel setFrame:CGRectMake((self.view.frame.size.width - noticeStrSize.width) / 2, foodBtn.frame.size.height + 20, noticeStrSize.width, noticeStrSize.height)];
}

- (void)reloadTableViewData
{
    [resultTableViewController.tableView reloadData];
    [resultTableViewController.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* shopCell = @"shopCell";
    static NSString* foodCell = @"foodCell";
    ShopLikeTableViewCell* cell;
    if (curStatus == FOOD) {
        cell = [tableView dequeueReusableCellWithIdentifier:foodCell];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:shopCell];
    }
    if (cell == nil) {
        if (curStatus == FOOD) {
            cell = [[[ShopLikeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:foodCell info:[[[Global sharedInstance] foodCollectionList] objectAtIndex:indexPath.row] type:FOOD] autorelease];
        }else{
            cell = [[[ShopLikeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shopCell info:[[[Global sharedInstance] shopCollectionList] objectAtIndex:indexPath.row] type:SHOP] autorelease];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma RefreshTableViewController delegate function
- (void)reloadData
{
    [resultTableViewController performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:0.3];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [resultTableViewController scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [resultTableViewController scrollViewDidEndDragging];
}

@end
