//
//  AddressManageViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "AddressManageViewController.h"
#import "AddressCardViewController.h"
#import "UIImage+Extensions.h"

//#import "UIRadioButton.h"

@interface AddressManageViewController ()

@end

@implementation AddressManageViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        title = @"送餐地址管理";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    mainScrollView.pagingEnabled = YES;
    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];
    
    for (int i = 0; i < 10; i++) {
        float cardWidth = self.view.frame.size.width - 40;
        float cardHeight = self.view.frame.size.height - 200;
        AddressCardViewController* addressCard = [[AddressCardViewController alloc] initWithFrame:CGRectMake((self.view.frame.size.width - cardWidth) / 2 + i * self.view.frame.size.width, 40, cardWidth, cardHeight) withAddressInfo:nil parentController:self];
        [mainScrollView addSubview:addressCard.view];
    }
    
    [mainScrollView setContentSize:CGSizeMake(self.view.frame.size.width * 10, self.view.frame.size.height)];
    
//    UIRadioButton* radioButton = [[UIRadioButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [radioButton setBackgroundImage:[UIImage getImageWithFileName:@"lvdian0"] forState:UIControlStateNormal];
//    [radioButton setBackgroundImage:[UIImage getImageWithFileName:@"lvdian1"] forState:UIControlStateSelected];
//    [radioButton setTitle:@"送餐" forState:UIControlStateNormal];
//    [radioButton setTitle:@"送餐" forState:UIControlStateSelected];
//    [radioButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//    [radioButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
//    [radioButton setFont:[UIFont systemFontOfSize:16.0]];
//    [self.view addSubview:radioButton];
//    [radioButton setNeedsDisplay];
}

- (void)startModify
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
