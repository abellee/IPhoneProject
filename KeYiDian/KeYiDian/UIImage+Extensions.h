//
//  UIImage+Extensions.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extensions)

+ (UIImage*)getImageWithFileName:(NSString*)path;
- (UIImage*)scaleToSize:(CGSize)size;
- (UIImage *)fixOrientation;

@end
