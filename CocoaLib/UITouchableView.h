//
//  UITouchableView.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITouchableViewDelegate.h"

@interface UITouchableView : UIView{
    id<UITouchableViewDelegate> delegate;
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id<UITouchableViewDelegate> delegate;

@end
