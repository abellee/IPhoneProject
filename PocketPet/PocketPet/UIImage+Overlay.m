//
//  UIImage+Overlay.m
//  YiZu
//
//  Created by Lee Abel on 12-10-22.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "UIImage+Overlay.h"

@implementation UIImage (Overlay)

-(UIImage*)imageWithOverlayColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    if(UIGraphicsBeginImageContextWithOptions){
        CGFloat imageScale = 1.0f;
        if([self respondsToSelector:@selector(scale)]){
            imageScale = self.scale;
        }
        UIGraphicsBeginImageContextWithOptions(self.size, NO, imageScale);
    }else{
        UIGraphicsBeginImageContext(self.size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetBlendMode(context, kCGBlendModeMultiply);
    CGContextDrawImage(context, rect, self.CGImage);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextClipToMask(context, rect, self.CGImage);
    CGContextFillRect(context, rect);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)saveToAlbum
{
    UIImageWriteToSavedPhotosAlbum(self, nil, nil, nil);
}

@end
