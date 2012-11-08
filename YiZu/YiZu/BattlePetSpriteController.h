//
//  BattlePetSpriteController.h
//  YiZu
//
//  Created by Lee Abel on 12-11-7.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class PP_Pet;
@interface BattlePetSpriteController : NSObject{
    CCSprite* view;
    NSObject* data;
    NSObject* targetData;
    
}

@property (nonatomic, retain, getter = view, setter = view:) CCSprite* view;
@property (nonatomic, retain, getter = data, setter = data:) NSObject* data;
@property (nonatomic, retain, getter = targetData, setter = targetData:) NSObject* targetData;

-(id)initWithCCSprite:(CCSprite*)petView viewData:(NSObject*)petData;

@end
