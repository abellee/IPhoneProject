//
//  UIImage+ImageScale.m
//  HanloonViewer
//
//  Created by Lee Abel on 13-2-19.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "UIImage+ImageScale.h"

@implementation UIImage (ImageScale)

-(UIImage*)scaleToSize:(CGSize)size
{
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
