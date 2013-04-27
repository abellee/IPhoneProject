//
//  HurryUpHeadView.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-6.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrderInfo;
@interface HurryUpHeadView : UIControl
{
    OrderInfo* orderInfo;
    UILabel* shopNameLabel;
    UILabel* orderTimeLabel;
    UIButton* hurryButton;
}

@property (nonatomic, assign, getter = isOpened, setter = isOpened:) BOOL isOpened;

- (id)initWithFrame:(CGRect)frame andOrderInfo:(OrderInfo*)info;

@end
