//
//  ShoppingCartBarViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopIndexViewController;
@interface ShoppingCartBarViewController : UIViewController
{
    UIView* background;
    UIButton* jiesuanButton;
    UITextField* numAndPrice;
    
    float curNum;
    float curPrice;
}

@property (nonatomic, assign, getter = parentController, setter = parentController:) ShopIndexViewController* parentController;

- (void)addNumAndPrice:(float)num withPrice:(float)price;

@end
