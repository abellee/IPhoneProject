//
//  ShoppingCartBarViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShoppingCartBarViewController.h"
#import "UIImage+Extensions.h"
#import "ShopIndexViewController.h"

@interface ShoppingCartBarViewController ()

@end

@implementation ShoppingCartBarViewController

@synthesize parentController;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    background.backgroundColor = [UIColor blackColor];
    background.alpha = 0.8;
    [self.view addSubview:background];
    
    UIImage* jiesuanNormal = [UIImage getImageWithFileName:@"ctcd_js0"];
    UIImage* jiesuanHighlighted = [UIImage getImageWithFileName:@"ctcd_js1"];
    jiesuanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [jiesuanButton setBackgroundImage:jiesuanNormal forState:UIControlStateNormal];
    [jiesuanButton setBackgroundImage:jiesuanHighlighted forState:UIControlStateHighlighted];
    [jiesuanButton setFrame:CGRectMake(10, (60 - jiesuanNormal.size.height) / 2, jiesuanNormal.size.width, jiesuanNormal.size.height)];
    [self.view addSubview:jiesuanButton];
    [jiesuanButton addTarget:self action:@selector(jiesuanButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    numAndPrice = [[UITextField alloc] initWithFrame:CGRectMake(jiesuanButton.frame.origin.x + jiesuanButton.frame.size.width + 10, jiesuanButton.frame.origin.y, self.view.frame.size.width - jiesuanButton.frame.size.width - 30, jiesuanButton.frame.size.height)];
    numAndPrice.textAlignment = NSTextAlignmentRight;
    numAndPrice.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    numAndPrice.userInteractionEnabled = NO;
    [numAndPrice setTextColor:[UIColor whiteColor]];
    [numAndPrice setText:@"测试"];
    [self.view addSubview:numAndPrice];
}

- (void)jiesuanButtonPressed:(id)sender
{
    if (parentController) {
        [parentController goJieSuan];
    }
}

- (void)addNumAndPrice:(float)num withPrice:(float)price
{
    curNum = curNum + num;
    curPrice = curPrice + price;
    [numAndPrice setText:[NSString stringWithFormat:@"%f份美食 ｜ 合计%f元", curNum, curPrice]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
