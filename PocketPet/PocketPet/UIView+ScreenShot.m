//
//  UIView+ScreenShot.m
//  YiZu
//
//  Created by Lee Abel on 12-10-22.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "UIView+ScreenShot.h"

@implementation UIView (ScreenShot)

-(UIImage*)screenShotWithCGRect:(CGRect)rect
{
    if (NULL != UIGraphicsBeginImageContextWithOptions) {
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    }else{
        UIGraphicsBeginImageContext(rect.size);
    }
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
