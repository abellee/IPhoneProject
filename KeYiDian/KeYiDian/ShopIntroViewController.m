//
//  ShopIntroViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShopIntroViewController.h"
#import "ShopInfo.h"

@interface ShopIntroViewController ()

@end

@implementation ShopIntroViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame andShopInfo:(ShopInfo *)info
{
    if (self = [super init]) {
        [self.view setFrame:frame];
        shopInfo = info;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    CALayer* noticeLayer = [CALayer layer];
    noticeLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    noticeLayer.shadowColor = [UIColor blackColor].CGColor;
    noticeLayer.shadowOpacity = 0.5;
    noticeLayer.shadowOffset = CGSizeMake(0, 2);
    noticeLayer.shadowRadius = 2;
    [noticeLayer setFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    noticeLayer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 50, self.view.frame.size.width, 20) cornerRadius:0].CGPath;
    [self.view.layer addSublayer:noticeLayer];
    
    NSString* deliveryStr = @"配送范围：中和大厦、天民大厦、四季四季花园";
    deliveryRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, noticeLayer.frame.origin.y + 10, self.view.frame.size.width - 20 * 2, 24)];
    [deliveryRangeLabel setTextColor:[UIColor grayColor]];
    [deliveryRangeLabel setText:deliveryStr];
    [deliveryRangeLabel setFont:[UIFont systemFontOfSize:14.0]];
    deliveryRangeLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:deliveryRangeLabel];
    
    NSString* noticeStr = @"距离不同起送价不同";
    noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, deliveryRangeLabel.frame.origin.y + deliveryRangeLabel.frame.size.height, deliveryRangeLabel.frame.size.width, deliveryRangeLabel.frame.size.height)];
    [noticeLabel setText:noticeStr];
    [noticeLabel setTextColor:[UIColor redColor]];
    [noticeLabel setFont:[UIFont systemFontOfSize:14.0]];
    [noticeLabel setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:noticeLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
