//
//  ResourcePoint.h
//  YiZu
//
//  Created by Lee Abel on 12-10-27.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PointSprite.h"

@interface ResourcePoint : PointSprite

@property (nonatomic, assign, getter = type, setter = type:) int type;
@property (nonatomic, assign, getter = subtype, setter = subtype:) int subtype;
@property (nonatomic, assign, getter = level, setter = level:) int level;

@end
