//
//  SearchViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-20.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "SearchViewController.h"
#import "UIImage+Extensions.h"
#import "RefreshTableViewController.h"
#import "ShopLikeTableViewCell.h"
#import "Global.h"
#import "ShopInfo.h"
#import "ImageURL.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 230, 2, 220, 45)];
    searchBar.backgroundColor = [UIColor clearColor];
    searchBar.placeholder = @"搜索附近餐厅";
    searchBar.delegate = self;
    [[searchBar.subviews objectAtIndex:0] removeFromSuperview];
    self.navigationItem.titleView = searchBar;
    
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
    [foodBtn setTitle:@"搜餐厅" forState:UIControlStateNormal];
    [foodBtn setTitle:@"搜餐厅" forState:UIControlStateSelected];
    [foodBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [foodBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [foodBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected | UIControlStateHighlighted];
    [foodBtn setFrame:CGRectMake(leftPosX, 10, foodBtnNormal.size.width, foodBtnNormal.size.height)];
    [foodBtn addTarget:self action:@selector(searchShopBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    shopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shopBtn setBackgroundImage:shopBtnNormal forState:UIControlStateNormal];
    [shopBtn setBackgroundImage:shopBtnNormal forState:UIControlStateHighlighted];
    [shopBtn setBackgroundImage:shopBtnSelected forState:UIControlStateSelected];
    [shopBtn setBackgroundImage:shopBtnSelected forState:UIControlStateSelected | UIControlStateHighlighted];
    [shopBtn setTitle:@"搜美食" forState:UIControlStateNormal];
    [shopBtn setTitle:@"搜美食" forState:UIControlStateSelected];
    [shopBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [shopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [shopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected | UIControlStateHighlighted];
    [shopBtn setFrame:CGRectMake(foodBtn.frame.origin.x + foodBtn.frame.size.width, 10, shopBtnNormal.size.width, shopBtnNormal.size.height)];
    [shopBtn addTarget:self action:@selector(searchFoodBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    masker = [[UIView alloc] initWithFrame:resultTableViewController.view.frame];
    masker.backgroundColor = [UIColor blackColor];
    masker.alpha = 0.5;
    
    indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicatorView setFrame:CGRectMake((self.view.frame.size.width - indicatorView.frame.size.width) / 2, resultTableViewController.view.frame.origin.y, indicatorView.frame.size.width, indicatorView.frame.size.height)];
    
    foodBtn.selected = YES;
    curStatus = SHOP;
}

- (void)searchShopBtnPressed:(id)sender
{
    searchBar.placeholder = @"搜索附近餐厅";
    shopBtn.selected = NO;
    foodBtn.selected = YES;
    curStatus = SHOP;
}

- (void)searchFoodBtnPressed:(id)sender
{
    searchBar.placeholder = @"搜索附近美食";
    shopBtn.selected = YES;
    foodBtn.selected = NO;
    curStatus = FOOD;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [searchBar resignFirstResponder];
    [masker removeFromSuperview];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)sb
{
    [self.view addSubview:masker];
    [indicatorView stopAnimating];
    [indicatorView removeFromSuperview];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)sb
{
    [searchBar resignFirstResponder];
    [masker removeFromSuperview];
    [self.view addSubview:indicatorView];
    [indicatorView startAnimating];
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
