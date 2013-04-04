//
//  ShopIntroDetailViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShopIntroDetailViewController.h"
#import "Utility.h"
#import "UIImage+Extensions.h"

@interface ShopIntroDetailViewController ()

@end

@implementation ShopIntroDetailViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)rect withShopInfo:(ShopInfo *)info
{
    if (self = [super init]) {
        [self.view setFrame:rect];
        shopInfo = info;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage getImageWithFileName:@"shouyedi"]];
    
    float fullWidth = self.view.frame.size.width - 20 * 2;
    
    NSString* deliveryStr = [NSString stringWithFormat:@"%@%@", @"配送范围: ", @"铂金时代铂金时代铂金时代铂金时代铂金时代铂金时代铂金时代铂金时代铂"];
    CGFloat realHeight = [Utility getTextHeightWithString:deliveryStr constrainedToSize:CGSizeMake(self.view.frame.size.width - 20 * 2, 20000.0) fontSize:14.0 withMinHeight:24.0];
    deliveryRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, fullWidth, realHeight)];
    deliveryRangeLabel.numberOfLines = 0;
    deliveryRangeLabel.lineBreakMode = UILineBreakModeWordWrap;
    [deliveryRangeLabel setText:deliveryStr];
    deliveryRangeLabel.backgroundColor = [UIColor clearColor];
    [deliveryRangeLabel setTextColor:[UIColor darkGrayColor]];
    [deliveryRangeLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.view addSubview:deliveryRangeLabel];
    
    NSString* timeStr = [NSString stringWithFormat:@"%@%@", @"配送时间: ", @"10:00 - 11:00"];
    CGSize timeStrSize = [Utility getCGSizeWithFontSize:14.0 str:timeStr isBold:NO];
    deliveryTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, realHeight + 20, fullWidth, timeStrSize.height)];
    [deliveryTimeLabel setText:timeStr];
    [deliveryTimeLabel setTextColor:[UIColor darkGrayColor]];
    [deliveryTimeLabel setBackgroundColor:[UIColor clearColor]];
    [deliveryTimeLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.view addSubview:deliveryTimeLabel];
    
    NSString* costStr = [NSString stringWithFormat:@"%@%d元", @"配送费: ", 10];
    CGSize costStrSize = [Utility getCGSizeWithFontSize:14.0 str:costStr isBold:NO];
    deliveryCostLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, deliveryTimeLabel.frame.origin.y + deliveryTimeLabel.frame.size.height + 10, fullWidth, costStrSize.height)];
    [deliveryCostLabel setText:costStr];
    [deliveryCostLabel setTextColor:[UIColor darkGrayColor]];
    [deliveryCostLabel setBackgroundColor:[UIColor clearColor]];
    [deliveryCostLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.view addSubview:deliveryCostLabel];
    
    NSString* addressStr = [NSString stringWithFormat:@"%@%@", @"地址: ", @"春晓路月明路123号"];
    CGSize addressStrSize = [Utility getCGSizeWithFontSize:14.0 str:addressStr isBold:NO];
    addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, deliveryCostLabel.frame.size.height + deliveryCostLabel.frame.origin.y + 10, fullWidth, addressStrSize.height)];
    [addressLabel setText:addressStr];
    [addressLabel setTextColor:[UIColor darkGrayColor]];
    [addressLabel setBackgroundColor:[UIColor clearColor]];
    [addressLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.view addSubview:addressLabel];
    
    NSString* orderStr = [NSString stringWithFormat:@"%@%@", @"订餐电话: ", @"0571-12345678"];
    CGSize orderStrSize = [Utility getCGSizeWithFontSize:14.0 str:orderStr isBold:NO];
    orderPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, addressLabel.frame.origin.y + addressLabel.frame.size.height + 10, fullWidth, orderStrSize.height)];
    [orderPhoneLabel setText:orderStr];
    [orderPhoneLabel setTextColor:[UIColor darkGrayColor]];
    [orderPhoneLabel setBackgroundColor:[UIColor clearColor]];
    [orderPhoneLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.view addSubview:orderPhoneLabel];
    
    NSString* noticeStr = [NSString stringWithFormat:@"%@%@", @"公告: ", @"公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告"];
    CGFloat noticeRealHeight = [Utility getTextHeightWithString:noticeStr constrainedToSize:CGSizeMake(fullWidth, 20000.0) fontSize:14.0 withMinHeight:24.0];
    noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, orderPhoneLabel.frame.origin.y + orderPhoneLabel.frame.size.height + 20, fullWidth, noticeRealHeight)];
    noticeLabel.numberOfLines = 0;
    noticeLabel.lineBreakMode = UILineBreakModeWordWrap;
    [noticeLabel setText:noticeStr];
    [noticeLabel setTextColor:[UIColor darkGrayColor]];
    [noticeLabel setBackgroundColor:[UIColor clearColor]];
    [noticeLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.view addSubview:noticeLabel];
    
    NSString* descriptionStr = @"简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介";
    CGFloat desHeight = [Utility getTextHeightWithString:descriptionStr constrainedToSize:CGSizeMake(fullWidth, 20000.0) fontSize:14.0 withMinHeight:24.0];
    descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, noticeLabel.frame.origin.y + noticeLabel.frame.size.height + 20, fullWidth, desHeight)];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.lineBreakMode = UILineBreakModeWordWrap;
    [descriptionLabel setText:descriptionStr];
    [descriptionLabel setTextColor:[UIColor darkGrayColor]];
    [descriptionLabel setBackgroundColor:[UIColor clearColor]];
    [descriptionLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.view addSubview:descriptionLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
