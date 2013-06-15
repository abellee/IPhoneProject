//
//  ImageInfoInCanvas.h
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-4-28.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import "ImageInfo.h"

@class SubInfo;
@interface ImageInfoInCanvas : ImageInfo

@property (nonatomic, assign, getter = pos, setter = pos:) NSPoint pos;
@property (nonatomic, assign, getter = zIndex, setter = zIndex:) int zIndex;
@property (nonatomic, assign, getter = isJPG, setter = isJPG:) BOOL isJPG;
@property (nonatomic, retain, getter = subInfo, setter = subInfo:) SubInfo* subInfo;

@end
