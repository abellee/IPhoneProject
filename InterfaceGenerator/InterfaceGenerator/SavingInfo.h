//
//  SavingInfo.h
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-5-3.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavingInfo : NSObject

@property (nonatomic, copy, getter = imageData, setter = imageData:) NSImage* imageData;
@property (nonatomic, assign, getter = startIndex, setter = startIndex:) int startIndex;
@property (nonatomic, assign, getter = imageLen, setter = imageLen:) int imageLen;

@end
