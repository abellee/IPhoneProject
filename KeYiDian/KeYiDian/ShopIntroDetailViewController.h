//
//  ShopIntroDetailViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopInfo;
@interface ShopIntroDetailViewController : UIViewController
{
    ShopInfo* shopInfo;
    UILabel* deliveryRangeLabel;
    UILabel* deliveryTimeLabel;
    UILabel* deliveryCostLabel;
    UILabel* addressLabel;
    UILabel* orderPhoneLabel;
    UILabel* noticeLabel;
    UILabel* descriptionLabel;
}

- (id)initWithFrame:(CGRect)rect withShopInfo:(ShopInfo*)info;

@end
