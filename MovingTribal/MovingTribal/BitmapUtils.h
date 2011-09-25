//
//  BitmapUtils.h
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

enum{
	kLeftTop,             //左上
	kLeftMiddle,          //左中
	kLeftBottom,          //左下
	kBottomLeft,          //下左
	kBottomCenter,        //下中
	kBottomRight,         //下右
	kRightBottom,         //右下
	kRightBottomCenter,   //右中
	kRightBottomTop,      //右上
	kTopRight,            //上右
	kTopCenter,           //上中
	kTopLeft              //上左
};
typedef NSUInteger kDirection;

@interface BitmapUtils : NSObject

+ (CGContextRef)bitmapContextCreate:(int)width pixelsHight:(int)height;
+ (UIImage *)createBubble:(CGContextRef)context rect:(CGRect)rect dir:(kDirection)dir arcRadius:(float)radius backgroundColor:(int)backgroundColor;

@end
