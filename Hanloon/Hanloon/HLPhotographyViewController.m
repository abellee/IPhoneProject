//
//  HLPhotographyViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "HLPhotographyViewController.h"

@interface HLPhotographyViewController ()

@end

@implementation HLPhotographyViewController

- (id)init
{
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"****************** HLPhotographyViewController dealloc ******************");
    
    [background release];
    [cateButton release];
    [photoCateLabel release];
    [orderLabel release];
    
    [super dealloc];
}

- (void)initView
{
    self.view.transform = CGAffineTransformRotate(self.view.transform, -M_PI / 2);
    background = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"background" ofType:@"png"]]];
    background.transform = CGAffineTransformRotate(background.transform, -M_PI / 2);
    [background setFrame:CGRectMake(0, 0, background.frame.size.width, background.frame.size.height)];
    [self.view addSubview:background];
    
    float fontSize = 20;
    photoCateLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 200, 40)];
    [photoCateLabel setText:@"照片类型:"];
    photoCateLabel.backgroundColor = [UIColor clearColor];
    [photoCateLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [photoCateLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:photoCateLabel];
    
    UIImage* cateTextImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cateText" ofType:@"png"]];
    cateButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    [cateButton setBackgroundImage:cateTextImage forState:UIControlStateNormal];
    [cateButton setBackgroundImage:cateTextImage forState:UIControlStateHighlighted];
    [cateButton setFrame:CGRectMake(130, 30, cateTextImage.size.width, cateTextImage.size.height)];
    [cateButton setTitle:@"点击选择照片分类..." forState:UIControlStateNormal];
    [cateButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [cateButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [cateButton setContentEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [self.view addSubview:cateButton];
    [cateButton addTarget:self action:@selector(cateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    orderLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 90, 200, 40)];
    [orderLabel setText:@"尺寸单号:"];
    orderLabel.backgroundColor = [UIColor clearColor];
    [orderLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [orderLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:orderLabel];
    
    UIImage* orderChooseImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cateButton" ofType:@"png"]];
    orderChooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [orderChooseButton setBackgroundImage:orderChooseImage forState:UIControlStateNormal];
    [orderChooseButton setFrame:CGRectMake(130, 90, orderChooseImage.size.width, orderChooseImage.size.height)];
    [orderChooseButton setTitle:@"选择所属门店" forState:UIControlStateNormal];
    [orderChooseButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [orderChooseButton.titleLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [self.view addSubview:orderChooseButton];
    [orderChooseButton addTarget:self action:@selector(orderChooseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)orderChooseButtonPressed:(id)sender
{
    NSLog(@"order choose button pressed");
}

- (void)cateButtonPressed:(id)sender
{
    NSLog(@"cateButton pressed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
