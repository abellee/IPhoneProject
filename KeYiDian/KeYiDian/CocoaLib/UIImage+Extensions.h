//
//  UIImage+Extensions.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIImage (Extensions)

+ (UIImage*)getImageWithFileName:(NSString*)path;
+ (UIImage*)screenshot:(UIView*)view;
- (UIImage*)scaleToSize:(CGSize)size;
- (UIImage *)fixOrientation;

@end
