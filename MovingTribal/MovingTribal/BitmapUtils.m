//
//  BitmapUtils.m
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BitmapUtils.h"

@implementation BitmapUtils

+ (CGContextRef)bitmapContextCreate:(int)width pixelsHight:(int)height
{
	CGContextRef context = nil;
	CGColorSpaceRef colorspace;
	void* bitmapData;
	int bitmapBytesPerRow = width * 4;                 // r g b a 各8bit=1bytes 一行共用多少bytes
	int bitsPerComponent = 8;
	int totalBytes = bitmapBytesPerRow * height;       // 整张图片所使用的总bytes
	
	colorspace = CGColorSpaceCreateDeviceRGB();        // 创建设备色彩空间
	bitmapData = malloc(totalBytes);                   // 为bitmap分配内存空间
	if (bitmapData == nil) {
		CGColorSpaceRelease(colorspace);
		NSLog(@"Memory not malloc!");
		return nil;
	}
	
	context = CGBitmapContextCreate(bitmapData,
									width,
									height,
									bitsPerComponent,
									bitmapBytesPerRow,
									colorspace,
									kCGImageAlphaPremultipliedLast);
	if(context == nil){
		CGColorSpaceRelease(colorspace);
		free(bitmapData);
		NSLog(@"Context not create!");
		return nil;
	}
	
	CGColorSpaceRelease(colorspace);
	
	return context;
}

+ (UIImage *)createBubble:(CGContextRef)context rect:(CGRect)rect dir:(kDirection)dir arcRadius:(float)radius backgroundColor:(int)backgroundColor
{
	CGMutablePathRef path = CGPathCreateMutable();
	
	// draw rectangle
	CGFloat triangleWidth = 10;
	CGFloat triangleMargin = 10;
	CGFloat triangleHeight = 10;
	CGFloat minX = CGRectGetMinX(rect) + triangleWidth, maxX = CGRectGetMaxX(rect);
	CGFloat minY = CGRectGetMinY(rect), maxY = CGRectGetMaxY(rect);
	CGPathMoveToPoint(path, nil, minX, minY);
	CGPathAddArcToPoint(path, nil, minX, maxY, minX + radius, maxY, radius);
	CGPathAddArcToPoint(path, nil, maxX, maxY, maxX, maxY - radius, radius);
	CGPathAddArcToPoint(path, nil, maxX, minY, maxX - radius, minY, radius);
	CGPathAddArcToPoint(path, nil, minX, minY, minX, minY + radius, radius);
	
	switch (dir) {
		case kLeftTop:
			CGPathMoveToPoint(path, nil, minX, maxY - triangleMargin);
			CGPathAddLineToPoint(path, nil, minX - triangleWidth, maxY - radius - triangleHeight / 2);
			CGPathAddLineToPoint(path, nil, minX, maxY - radius - triangleHeight);
			break;
			
		default:
			break;
	}
	
	// draw border
//	CGContextSetLineJoin(context, kCGLineJoinRound);
//	CGFloat strokeColor[4] = {10 / 255, (borderColor >> 8 & 0xFF) / 255, (borderColor & 0xFF) / 255, 1.0};
//	CGContextSetLineWidth(context, borderWidth);
//	CGContextAddPath(context, path);
//	CGContextSetStrokeColorSpace(context, CGColorSpaceCreateDeviceRGB());
//	CGContextSetStrokeColor(context, strokeColor);
//	CGContextStrokePath(context);
//	
//	CGSize offset = CGSizeMake(shadowOffset, shadowOffset);
//	CGContextSaveGState(context);
//	
//	// draw shadow
//	CGContextSetShadow(context, offset, shadowBlur);
//	CGContextSetLineJoin(context, kCGLineJoinRound);
//	CGFloat strokeColor1[4] = {200 / 255, (shadowColor >> 8 & 0xFF) / 255, (shadowColor & 0xFF) / 255, 1.0};
//	CGContextSetLineWidth(context, shadowWidth);
//	CGContextAddPath(context, path);
//	CGContextSetStrokeColorSpace(context, CGColorSpaceCreateDeviceRGB());
//	CGContextSetStrokeColor(context, strokeColor1);
//	CGContextStrokePath(context);
//	
//	CGContextRestoreGState(context);
	
	CGContextAddPath(context, path);
	CGColorSpaceRef fillColorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextSetFillColorSpace(context, fillColorSpace);
	CGFloat fillColor[4] = {(backgroundColor >> 16 & 0xFF) / 255, (backgroundColor >> 8 & 0xFF) / 255, (backgroundColor & 0xFF) / 255, 1.0};
	CGContextSetFillColor(context, fillColor);
	CGContextEOFillPath(context);
	
	CGColorSpaceRelease(fillColorSpace);
	
	CGImageRef cgImage = CGBitmapContextCreateImage(context);
	UIImage* image = [UIImage imageWithCGImage:cgImage];
	CGImageRelease(cgImage);
	
	return image;
}

@end
