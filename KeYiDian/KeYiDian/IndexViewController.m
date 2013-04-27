//
//  IndexViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-9.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "IndexViewController.h"
#import "ShopTableViewController.h"
#import "UIImage+Extensions.h"

#import "HurryUpViewController.h"
#import "OrderListViewController.h"
#import "AddressManageViewController.h"
#import "CollectionViewController.h"
#import "CommentManagerViewController.h"
#import "LoginViewController.h"

#import "SearchViewController.h"
#import "ChangeLocationViewController.h"
#import "AboutViewController.h"
#import "FeedBackViewController.h"

#import "ShopDetailViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage getImageWithFileName:@"shouyedi"]];
    
    shopTableViewController = [[ShopTableViewController alloc] init];
    [shopTableViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [shopTableViewController parentController:self];
    
    navigator = [[UINavigationController alloc] initWithRootViewController: shopTableViewController];
    [navigator.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    navigator.delegate = self;
    
    if ([UINavigationBar instancesRespondToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [navigator.navigationBar setBackgroundImage:[UIImage getImageWithFileName:@"top"] forBarMetrics:UIBarMetricsDefault];
    }else{
        UIImageView* topBackground = [[UIImageView alloc] initWithImage:[UIImage getImageWithFileName:@"top"]];
        [navigator.navigationBar insertSubview:topBackground atIndex:1];
        [topBackground release];
    }
    
    [self.view addSubview:navigator.view];
}

- (void)hurryUpInterface
{
    HurryUpViewController* hurryUp = [[HurryUpViewController alloc] initWithOrderInfoList:nil];
    [navigator pushViewController:hurryUp animated:NO];
    [hurryUp release];
    [self panLeftAuto:YES];
}

- (void)processingOrderInterface
{
    OrderListViewController* orderListView = [[OrderListViewController alloc] initWithData:nil andTitle:@"处理中订单"];
    [navigator pushViewController:orderListView animated:NO];
    [orderListView release];
    [self panLeftAuto:YES];
}

- (void)monthlyInterface
{
    OrderListViewController* orderListView = [[OrderListViewController alloc] initWithData:nil andTitle:@"当月订单"];
    [navigator pushViewController:orderListView animated:NO];
    [orderListView release];
    [self panLeftAuto:YES];
}

- (void)addressManagerInterface
{
    AddressManageViewController* addressManager = [[AddressManageViewController alloc] init];
    [navigator pushViewController:addressManager animated:NO];
    [addressManager release];
    [self panLeftAuto:YES];
}

- (void)collectionInterface
{
    CollectionViewController* collectionView = [[CollectionViewController alloc] init];
    [navigator pushViewController:collectionView animated:NO];
    [collectionView release];
    [self panLeftAuto:YES];
}

- (void)commentManagerInterface
{
    CommentManagerViewController* commentView = [[CommentManagerViewController alloc] initWithCommentData:nil];
    [navigator pushViewController:commentView animated:NO];
    [commentView release];
    [self panLeftAuto:YES];
}

- (void)loginViewInterface
{
    LoginViewController* loginView = [[LoginViewController alloc] init];
    [navigator pushViewController:loginView animated:NO];
    [loginView release];
    [self panRightAuto:NO];
}

- (void)profileButtonPressed
{
    [self panRightAuto:YES];
    if (delegate && [delegate respondsToSelector:@selector(autoPanWithData:)]) {
        [delegate autoPanWithData:@"left"];
    }
}

- (void)searchViewInterface
{
    SearchViewController* searchView = [[SearchViewController alloc] init];
    [navigator pushViewController:searchView animated:NO];
    [searchView release];
    [self panRightAuto:NO];
}

- (void)changeLocationInterface
{
    ChangeLocationViewController* changeLocation = [[ChangeLocationViewController alloc] init];
    [navigator pushViewController:changeLocation animated:NO];
    [changeLocation release];
    [self panRightAuto:NO];
}

- (void)aboutInterface
{
    AboutViewController* aboutView = [[AboutViewController alloc] init];
    [navigator pushViewController:aboutView animated:NO];
    [aboutView release];
    [self panRightAuto:NO];
}

- (void)feedBackInterface
{
    FeedBackViewController* feedBack = [[FeedBackViewController alloc] init];
    [navigator pushViewController:feedBack animated:NO];
    [feedBack release];
    [self panRightAuto:NO];
}

- (void)moreButtonPressed
{
    [self panLeftAuto:NO];
    if (delegate && [delegate respondsToSelector:@selector(autoPanWithData:)]) {
        [delegate autoPanWithData:@"right"];
    }
}

- (void)logoPressed:(id)sender
{
    [shopTableViewController scrollToTop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
