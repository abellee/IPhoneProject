//
//  PublicInfo.h
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-5-15.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicInfo : NSObject

@property (nonatomic, assign, getter = subtype, setter = subtype:) int subtype;
@property (nonatomic, assign, getter = startIndex, setter = startIndex:) int startIndex;
@property (nonatomic, assign, getter = dataLen, setter = dataLen:) int dataLen;

@end
