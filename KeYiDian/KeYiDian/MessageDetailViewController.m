//
//  MessageDetailViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "MessageDetailViewController.h"
#import "Message.h"

@interface MessageDetailViewController ()

@end

@implementation MessageDetailViewController

- (id)initWithMessage:(Message *)message
{
    if (self = [super init]) {
        msg = message;
        title = msg.title;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    contentView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44)];
    contentView.contentSize = CGSizeMake(self.view.frame.size.width - 20, self.view.frame.size.height - 20);
    contentView.backgroundColor = [UIColor clearColor];
    contentView.showsHorizontalScrollIndicator = NO;
    [contentView setText:msg.content];
    [contentView setTextColor:[UIColor grayColor]];
    [contentView setFont:[UIFont systemFontOfSize:20.0]];
    [self.view addSubview:contentView];
}

- (void)resetMessage:(Message *)message
{
    msg = message;
    title = msg.title;
    UILabel* label = (UILabel*)self.navigationItem.titleView;
    if (label) {
        [label setText:title];
    }
    [contentView setText:msg.content];
    contentView.scrollsToTop = YES;
}

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [contentView release];
    msg = nil;
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
