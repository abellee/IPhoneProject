//
//  PPCCSprite.h
//  YiZu
//
//  Created by Lee Abel on 12-11-7.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface PPCCSprite : CCSprite <CCTargetedTouchDelegate> {
    NSObject* touchBeganObject;
    NSObject* touchMovedObject;
    NSObject* touchEndedObject;
    NSObject* touchCancelledObject;
    
    SEL touchBeganSelector;
    SEL touchMovedSelector;
    SEL touchEndedSelector;
    SEL touchCancelledSelector;
    
    BOOL isTouchEnabled;
    int cur_priority;
}

-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents priority:(int)priority;
-(void)removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
