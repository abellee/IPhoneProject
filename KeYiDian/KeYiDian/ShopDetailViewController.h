//
//  ShopDetailViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-25.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import <QuartzCore/QuartzCore.h>

@class ShopIndexHeaderView;
@class ShopInfo;
@class ShopIntroDetailViewController;
@interface ShopDetailViewController : KYDBaseViewController<UIScrollViewDelegate>
{
    UIScrollView* infoImageScrollView;
    UIScrollView* mainScrollView;
    UIView* anchor;
    ShopInfo* shopInfo;
    ShopIndexHeaderView* headerView;
    ShopIntroDetailViewController* shopIntroDetail;
    UILabel* commentNumLabel;
    
    NSMutableArray* commentItemList;
}

- (id)initWithShopInfo:(ShopInfo*)info;

@end
