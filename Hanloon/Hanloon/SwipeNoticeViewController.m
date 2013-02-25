//
//  SwipeNoticeViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-24.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "SwipeNoticeViewController.h"
#import "Definitions.h"

@interface SwipeNoticeViewController ()

@end

@implementation SwipeNoticeViewController

- (void)dealloc
{
    NSLog(@"***************** SwipeNoticeViewController dealloc *******************");
    
    [background release];
    [noticeLabel release];
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    if (background == nil) {
        background = [[UIView alloc] initWithFrame:CGRectMake((FULL_WIDTH - 400) / 2, (FULL_HEIGHT - 200) / 2, 400, 200)];
        background.backgroundColor = [UIColor blackColor];
        background.layer.cornerRadius = 10;
        background.alpha = 0.5;
        [self.view addSubview:background];
    }
    
    if (noticeLabel == nil) {
        noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake((FULL_WIDTH - 400) / 2, (FULL_HEIGHT - 200) / 2, 400, 200)];
        noticeLabel.backgroundColor = [UIColor clearColor];
        [noticeLabel setTextColor:[UIColor whiteColor]];
        [noticeLabel setText:@"往右滑动屏幕选择分类!"];
        [noticeLabel setTextAlignment:NSTextAlignmentCenter];
        [noticeLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
        [self.view addSubview:noticeLabel];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
