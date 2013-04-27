//
//  ShopIndexHeaderView.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-23.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ShopInfo;
@class StarViewController;
@interface ShopIndexHeaderView : UIControl
{
    UIImageView* logoImage;
    
    UILabel* shopTasteLabel;
    
    ShopInfo* shopInfo;
    StarViewController* starViewController;
    
    UILabel* commentLabel;
    UILabel* speedLabel;
}

- (id)initWithFrame:(CGRect)frame andShopInfo:(ShopInfo*)info;

@end
