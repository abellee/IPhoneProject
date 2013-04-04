//
//  ShopIntroViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ShopInfo;
@interface ShopIntroViewController : UIViewController
{
    UILabel* deliveryRangeLabel;
    UILabel* noticeLabel;
    ShopInfo* shopInfo;
}

- (id)initWithFrame:(CGRect)frame andShopInfo:(ShopInfo*)info;

@end
