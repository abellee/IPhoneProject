//
//  ImageInfo.h
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-4-28.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageInfo : NSObject

@property (nonatomic, copy, getter = imagePath, setter = imagePath:) NSString* imagePath;
@property (nonatomic, assign, getter = isPublicRes, setter = isPublicRes:) BOOL isPublicRes;
@property (nonatomic, assign, getter = arrayIndex, setter = arrayIndex:) int arrayIndex;
@property (nonatomic, assign, getter = degree, setter = degree:) int degree;
@property (nonatomic, retain, getter = imageData, setter = imageData:) NSImage* imageData;
@property (nonatomic, assign, getter = subArrayIndex, setter = subArrayIndex:) int subArrayIndex;
@property (nonatomic, assign, getter = isFlipX, setter = isFlipX:) BOOL isFlipX;
@property (nonatomic, assign, getter = isFlipY, setter = isFlipY:) BOOL isFlipY;

@end
