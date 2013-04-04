//
//  KYDBaseViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import "Global.h"
#import "Utility.h"

@interface KYDBaseViewController ()

@end

@implementation KYDBaseViewController

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
    
    CGSize titleSize = [Utility getCGSizeWithFontSize:20.0 str:title isBold:YES];
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, titleSize.width, titleSize.height)];
    [titleLabel setText:title];
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
    [titleLabel setTextColor:[UIColor grayColor]];
    self.navigationItem.titleView = titleLabel;
    [titleLabel release];
    
    UIButton* backButton = [Global getBackwardButton];
    UIView* backwardButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, backButton.frame.size.width, backButton.frame.size.height)];
    [backwardButtonView addSubview:backButton];
    UIBarButtonItem* backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backwardButtonView];
    [backwardButtonView release];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
    [backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [backBarButtonItem release];
}

- (void)backButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
