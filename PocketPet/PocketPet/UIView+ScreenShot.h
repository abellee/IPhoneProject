//
//  UIView+ScreenShot.h
//  YiZu
//
//  Created by Lee Abel on 12-10-22.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (ScreenShot)

-(UIImage*)screenShotWithCGRect:(CGRect)rect;

@end
