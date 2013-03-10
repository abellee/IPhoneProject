//
//  UITouchableViewDelegate.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UITouchableViewDelegate <NSObject>

@optional
- (void)touchUpInside:(UIView*)view;

@end
