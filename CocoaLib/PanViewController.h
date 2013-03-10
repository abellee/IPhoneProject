//
//  PanViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-9.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PanViewControllerDelegate.h"

@interface PanViewController : UIViewController{
    UIView* masker;
    
    float preDis;
    float openPos;
    float isTwoSide;
    float maskerAlpha;
    float isMoving;
    
    BOOL isAnimating;
    
    id<PanViewControllerDelegate> delegate;
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id<PanViewControllerDelegate> delegate;

- (id)initWithOpenedPosition:(float)xpos isTwoSide:(BOOL)twoSide withMaskerAlpha:(float)alpha;
- (void)panLeftAuto:(BOOL)fromLeft;
- (void)panRightAuto:(BOOL)fromLeft;

@end
