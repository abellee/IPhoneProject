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

#import "OrderListViewController.h"
#import "ShopInfo.h"
#import "FoodInfo.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
    ShopInfo* shopInfo = [[ShopInfo alloc] init];
    shopInfo.shopName = @"测试名称";
    shopInfo.isCollected = NO;
    
    NSMutableArray* foodList = [[NSMutableArray alloc] initWithCapacity:0];
    FoodInfo* foodInfo0 = [[FoodInfo alloc] init];
    [foodInfo0 foodName:@"大鸡腿饭饭"];
    [foodInfo0 price:14.0];
    [foodInfo0 foodNum:10.0];
    [foodList addObject:foodInfo0];
    
    FoodInfo* foodInfo1 = [[FoodInfo alloc] init];
    [foodInfo1 foodName:@"大鸡腿饭饭"];
    [foodInfo1 price:13.0];
    [foodInfo1 foodNum:5.0];
    [foodList addObject:foodInfo1];
    
    FoodInfo* foodInfo2 = [[FoodInfo alloc] init];
    [foodInfo2 foodName:@"大鸡腿饭饭"];
    [foodInfo2 price:14.0];
    [foodInfo2 foodNum:10.0];
    [foodList addObject:foodInfo2];
    
    FoodInfo* foodInfo3 = [[FoodInfo alloc] init];
    [foodInfo3 foodName:@"大鸡腿饭饭"];
    [foodInfo3 price:13.0];
    [foodInfo3 foodNum:5.0];
    [foodList addObject:foodInfo3];
    
    FoodInfo* foodInfo4 = [[FoodInfo alloc] init];
    [foodInfo4 foodName:@"大鸡腿饭饭"];
    [foodInfo4 price:14.0];
    [foodInfo4 foodNum:10.0];
    [foodList addObject:foodInfo4];
    
    FoodInfo* foodInfo5 = [[FoodInfo alloc] init];
    [foodInfo5 foodName:@"大鸡腿饭饭"];
    [foodInfo5 price:13.0];
    [foodInfo5 foodNum:5.0];
    [foodList addObject:foodInfo5];
    
    OrderListViewController* aboutViewController = [[OrderListViewController alloc] initWithData:nil];
    [aboutViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [navigator pushViewController:aboutViewController animated:YES];
}

- (void)profileButtonPressed
{
    [self panRightAuto:YES];
    if (delegate && [delegate respondsToSelector:@selector(autoPanWithData:)]) {
        [delegate autoPanWithData:@"left"];
    }
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
