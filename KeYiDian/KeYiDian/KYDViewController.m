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
#import "ASINetworkQueue.h"
#import "LeftSideViewController.h"
#import "RightSideViewController.h"
#import "IndexViewController.h"
#import "UIImage+Extensions.h"

@implementation KYDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage* backgroundImage = [UIImage getImageWithFileName:@"gddi1"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];

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
    
    leftSideViewController = [[LeftSideViewController alloc] init];
    [leftSideViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:leftSideViewController.view];
    
    rightSideViewController = [[RightSideViewController alloc] init];
    [rightSideViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:rightSideViewController.view];
    
    indexViewController = [[IndexViewController alloc] initWithOpenedPosition:240 isTwoSide:YES withMaskerAlpha:0.5];
    [indexViewController.view setFrame:self.view.frame];
    indexViewController.delegate = self;
    [self.view addSubview:indexViewController.view];
    
    [[Global sharedInstance] curApp:self];
}

- (void)hurryUpInterface
{
    [indexViewController hurryUpInterface];
}

- (void)orderListInterface
{
    [indexViewController monthlyInterface];
}

- (void)addressManagerInterface
{
    [indexViewController addressManagerInterface];
}

- (void)collectionInterface
{
    [indexViewController collectionInterface];
}

- (void)commentManagerInterface
{
    [indexViewController commentManagerInterface];
}

- (void)processingOrderInterface
{
    [indexViewController processingOrderInterface];
}

- (void)searchViewInterface
{
    [indexViewController searchViewInterface];
}

- (void)changeLocationInterface
{
    [indexViewController changeLocationInterface];
}

- (void)aboutInterface
{
    [indexViewController aboutInterface];
}

- (void)feedBackInterface
{
    [indexViewController feedBackInterface];
}

- (void)logoff
{
    if ([[Global sharedInstance] isLogin]) {
        [[[Global sharedInstance] kydUser] release];
        [[Global sharedInstance] isLogin: NO];
    }
    [indexViewController loginViewInterface];
}

- (void)isPanning:(float)panDistance
{
    if (panDistance < 0 && indexViewController.view.frame.origin.x < 0) {
        [self autoPanWithData:@"right"];
    }else if(panDistance > 0 && indexViewController.view.frame.origin.x > 0){
        [self autoPanWithData:@"left"];
    }
}

- (void)autoPanWithData:(id)data
{
    if ([data isEqualToString:@"left"]) {
        if ([self.view.subviews indexOfObject:leftSideViewController.view] == 0) {
            [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        }
    }else if([data isEqualToString:@"right"]){
        if ([self.view.subviews indexOfObject:rightSideViewController.view] == 0) {
            [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        }
    }
}

-(BOOL) respondsToSelector:(SEL)aSelector {
    printf("SELECTOR: %s\n", [NSStringFromSelector(aSelector) UTF8String]);
    return [super respondsToSelector:aSelector];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
