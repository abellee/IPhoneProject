//
//  ShopIndexViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-22.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShopIndexViewController.h"
#import "ShopIndexHeaderView.h"
#import "UIImage+Extensions.h"
#import "FoodItemCell.h"
#import "ShoppingCartBarViewController.h"
#import "ShopIntroViewController.h"
#import "ShopDetailViewController.h"
#import "ShopCartViewController.h"

@interface ShopIndexViewController ()

@end

@implementation ShopIndexViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithTitle:(NSString *)titleStr andShopInfo:(ShopInfo *)info
{
    if (self = [super init]) {
        title = titleStr;
        shopInfo = info;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    infoImageArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    UIImage* infoImage = [UIImage getImageWithFileName:@"caomei"];
    UIImageView* infoImageView = [[UIImageView alloc] initWithImage:infoImage];
    
    infoImageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -60, infoImage.size.width, infoImage.size.height)];
    infoImageScrollView.pagingEnabled = YES;
    infoImageScrollView.contentSize = CGSizeMake(2000, infoImage.size.height);
    infoImageScrollView.showsHorizontalScrollIndicator = NO;
    infoImageScrollView.showsVerticalScrollIndicator = NO;
    [infoImageScrollView addSubview:infoImageView];
    
    headerView = [[ShopIndexHeaderView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 85) andShopInfo:nil];
    [headerView addTarget:self action:@selector(headerViewPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    shopIntro = [[ShopIntroViewController alloc] initWithFrame:CGRectMake(0, 105, self.view.frame.size.width, 70) andShopInfo:shopInfo];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shopIntroTapped:)];
    [shopIntro.view addGestureRecognizer:tap];
    [tap release];
    
    mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];
    
    tableViewContrller = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableViewContrller.tableView.dataSource = self;
    tableViewContrller.tableView.delegate = self;
    tableViewContrller.tableView.tag = 1;
    tableViewContrller.tableView.backgroundColor = [UIColor clearColor];
    tableViewContrller.tableView.backgroundView = nil;
    tableViewContrller.tableView.scrollEnabled = NO;
    tableViewContrller.tableView.showsVerticalScrollIndicator = NO;
    [tableViewContrller.tableView setFrame:CGRectMake(0, 180, self.view.frame.size.width, self.view.frame.size.height - 104)];
    [mainScrollView addSubview:infoImageScrollView];
    [mainScrollView addSubview:headerView];
    [mainScrollView addSubview:shopIntro.view];
    [mainScrollView addSubview:tableViewContrller.view];
    
    UIImage* cateNormal = [UIImage getImageWithFileName:@"fenglei0"];
    UIImage* cateHighlighted = [UIImage getImageWithFileName:@"fenglei1"];
    UIButton* cateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cateButton setBackgroundImage:cateNormal forState:UIControlStateNormal];
    [cateButton setBackgroundImage:cateHighlighted forState:UIControlStateHighlighted];
    [cateButton setFrame:CGRectMake(0, 0, cateNormal.size.width, cateNormal.size.height)];
    
    UIView* view = [[UIView alloc] initWithFrame:cateButton.frame];
    [view addSubview:cateButton];
    
    UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    [view release];
    [rightBarButtonItem release];
    
    shoppingCartBar = [[ShoppingCartBarViewController alloc] init];
    [shoppingCartBar.view setFrame:CGRectMake(0, self.view.frame.size.height - 104, self.view.frame.size.width, 110)];
    [shoppingCartBar parentController:self];
    [self.view addSubview:shoppingCartBar.view];
}

- (void)goJieSuan
{
    ShopCartViewController* shopCart = [[ShopCartViewController alloc] initWithShopInfo:nil andFoodList:nil];
    [self.navigationController pushViewController:shopCart animated:YES];
    [shopCart release];
}

- (void)shopIntroTapped:(UITapGestureRecognizer*)tap
{
    [self headerViewPressed:headerView];
}

- (void)headerViewPressed:(id)sender
{
    ShopDetailViewController* shopDetailView = [[ShopDetailViewController alloc] initWithShopInfo:nil];
    [self.navigationController pushViewController:shopDetailView animated:YES];
    [shopDetailView release];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag != 1) {
        if (scrollView.contentOffset.y >= 180) {
            scrollView.contentOffset = CGPointMake(0, 180);
            scrollView.scrollEnabled = NO;
            tableViewContrller.tableView.scrollEnabled = YES;
        }
    }else{
        if (scrollView.contentOffset.y <= 0) {
            scrollView.contentOffset = CGPointMake(0, 0);
            scrollView.scrollEnabled = NO;
            mainScrollView.scrollEnabled = YES;
        }
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* normalCell = @"normalCell";
    FoodItemCell* cell = [tableView dequeueReusableCellWithIdentifier:normalCell];
    if (cell == nil) {
        cell = [[[FoodItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:normalCell andFoodInfo:nil] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //cell.textLabel.text = @"abellee";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section > 0) {
        return @"test";
    }
    return nil;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
