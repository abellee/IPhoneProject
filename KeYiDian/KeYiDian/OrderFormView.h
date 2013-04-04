//
//  OrderFormView.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class OrderInfo;
@interface OrderFormView : UIControl
{
    UILabel* shopNameLabel;
    OrderInfo* orderInfo;
    UILabel* orderNumLabel;
    UILabel* orderTimeLabel;
    UILabel* telLabel;
    UILabel* statusLabel;
    UILabel* commentStatusLabel;
    UIButton* commentButton;
    UIButton* telButton;
}

@property (nonatomic, assign, getter = isOpen, setter = isOpen:) BOOL isOpen;

- (id)initWithFrame:(CGRect)frame andOrderInfo:(OrderInfo*)info;

@end
