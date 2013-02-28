//
//  KYDViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDViewController.h"
#import "UILoadingView.h"
#import "Global.h"
#import "Utility.h"
#import "Definitions.h"
#import "ShopTableViewController.h"
#import "ASINetworkQueue.h"

@interface KYDViewController ()

@end

@implementation KYDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UILoadingView* loadingView = [[UILoadingView alloc] initWithFrameAndContent:CGRectMake(0, 0, 200, 100) content:@"请稍候..."];
    [[Global sharedInstance] loadingView:loadingView];
    [loadingView release];
    loadingView = nil;
    
    ASINetworkQueue* queue = [[ASINetworkQueue alloc] init];
    queue.maxConcurrentOperationCount = 2;
    [queue go];
    [[Global sharedInstance] networkQueue:queue];
    [queue release];
    queue = nil;
    
    shopTableViewController = [[ShopTableViewController alloc] init];
    [shopTableViewController.view setFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT - 64)];
    
    navigator = [[UINavigationController alloc] initWithRootViewController: shopTableViewController];
    [navigator.view setFrame:self.view.frame];
    navigator.delegate = self;
    
    if ([UINavigationBar instancesRespondToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [navigator.navigationBar setBackgroundImage:[[Utility sharedInstance] getImageWithPath:@"top"] forBarMetrics:UIBarMetricsDefault];
    }else{
        UIImageView* topBackground = [[UIImageView alloc] initWithImage:[[Utility sharedInstance] getImageWithPath:@"top"]];
        [navigator.navigationBar insertSubview:topBackground atIndex:1];
        [topBackground release];
    }
    
    UIButton* kydButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* kydLogo = [[Utility sharedInstance] getImageWithPath:@"logo"];
    [kydButton setFrame:CGRectMake(0, 0, kydLogo.size.width, kydLogo.size.height)];
    [kydButton setImage:kydLogo forState:UIControlStateNormal];
    [kydButton setImage:kydLogo forState:UIControlStateHighlighted];
    kydButton.center = CGPointMake(navigator.navigationBar.frame.size.width / 2, navigator.navigationBar.frame.size.height / 2);
    [navigator.navigationBar addSubview:kydButton];
    [kydButton addTarget:self action:@selector(logoPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* profileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [profileButton setFrame:CGRectMake(0, 0, 30, 30)];
    [profileButton setImage:[[Utility sharedInstance] getImageWithPath:@"geren0"] forState:UIControlStateNormal];
    [profileButton setImage:[[Utility sharedInstance] getImageWithPath:@"geren1"] forState:UIControlStateHighlighted];
    [navigator.navigationBar addSubview:profileButton];
    profileButton.center = CGPointMake(25, navigator.navigationBar.frame.size.height / 2);
    [profileButton addTarget:self action:@selector(profileButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreButton setFrame:CGRectMake(0, 0, 30, 30)];
    [moreButton setImage:[[Utility sharedInstance] getImageWithPath:@"geduo0"] forState:UIControlStateNormal];
    [moreButton setImage:[[Utility sharedInstance] getImageWithPath:@"geduo1"] forState:UIControlStateHighlighted];
    moreButton.center = CGPointMake(navigator.navigationBar.frame.size.width - 25, navigator.navigationBar.frame.size.height / 2);
    [navigator.navigationBar addSubview:moreButton];
    [moreButton addTarget:self action:@selector(moreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:navigator.view];
}

- (void)profileButtonPressed:(id)sender
{
    NSLog(@"profile");
}

- (void)moreButtonPressed:(id)sender
{
    NSLog(@"more");
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
