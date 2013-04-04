//
//  ShoppingCartBarViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCartBarViewController : UIViewController
{
    UIView* background;
    UIButton* jiesuanButton;
    UITextField* numAndPrice;
    
    float curNum;
    float curPrice;
}

- (void)addNumAndPrice:(float)num withPrice:(float)price;

@end
