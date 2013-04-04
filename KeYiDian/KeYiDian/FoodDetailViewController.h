//
//  FoodDetailViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import <QuartzCore/QuartzCore.h>

@class ZhaoIcon;
@class StarViewController;
@class FoodInfo;
@interface FoodDetailViewController : KYDBaseViewController<UIScrollViewDelegate>
{
    UIScrollView* mainScrollView;
    UIView* imageFrame;
    ZhaoIcon* zhaoIcon;
    StarViewController* starViewController;
    UILabel* commentNumLabel;
    UILabel* soldNumLabel;
    UILabel* descriptionLabel;
    UILabel* commentItemNumLabel;
    
    UIButton* collectButton;
    UIButton* priceButton;
    
    FoodInfo* foodInfo;
}

- (id)initWithFoodInfo:(FoodInfo*)info;

@end
