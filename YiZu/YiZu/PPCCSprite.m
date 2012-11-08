//
//  PPCCSprite.m
//  YiZu
//
//  Created by Lee Abel on 12-11-7.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "PPCCSprite.h"

@implementation PPCCSprite

-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents priority:(int)priority
{
    if(!isTouchEnabled){
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:priority swallowsTouches:YES];
    }else{
        if(cur_priority != priority){
            [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
            [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:priority swallowsTouches:YES];
        }
    }
    cur_priority = priority;
    switch (controlEvents) {
        case UIControlEventTouchUpInside:
            touchBeganObject = target;
            touchBeganSelector = action;
            break;
        case UIControlEventAllEvents:
            touchBeganObject = target;
            touchCancelledObject = target;
            touchEndedObject = target;
            touchMovedObject = target;
            
            touchBeganSelector = action;
            touchCancelledSelector = action;
            touchEndedSelector = action;
            touchMovedSelector = action;
            break;
            
        default:
            break;
    }
}

-(void)removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    switch (controlEvents) {
        case UIControlEventTouchUpInside:
            touchBeganObject = nil;
            touchBeganSelector = nil;
            break;
        case UIControlEventAllEvents:
            [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
            isTouchEnabled = NO;
            touchBeganObject = nil;
            touchCancelledObject = nil;
            touchEndedObject = nil;
            touchMovedObject = nil;
            
            touchBeganSelector = nil;
            touchCancelledSelector = nil;
            touchEndedSelector = nil;
            touchMovedSelector = nil;
            break;
            
        default:
            break;
    }
}

-(CGRect)rect
{
    return CGRectMake(position_.x - contentSize_.width * anchorPoint_.x, position_.y - contentSize_.height * anchorPoint_.y, contentSize_.width, contentSize_.height);
}

-(BOOL)underTouched:(UITouch*)touch
{
    CGPoint touchLocation = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    CGPoint local = [self convertToNodeSpace:touchLocation];
    CGRect r = [self rect];
    r.origin = CGPointZero;
    BOOL isTouched = CGRectContainsPoint(r, local);
    return isTouched;
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if(touchBeganObject && touchBeganSelector && [touchBeganObject respondsToSelector:touchBeganSelector] && [self underTouched:touch]){
        [touchBeganObject performSelector:touchBeganSelector withObject:self];
        return YES;
    }
    return NO;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    if(touchMovedObject && touchMovedSelector && [touchMovedObject respondsToSelector:touchMovedSelector]){
        [touchMovedObject performSelector:touchMovedSelector withObject:self];
    }
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    if(touchEndedObject && [touchEndedObject respondsToSelector:touchEndedSelector]){
        [touchEndedObject performSelector:touchEndedSelector withObject:self];
    }
}

-(void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    if(touchCancelledObject && [touchCancelledObject respondsToSelector:touchCancelledSelector]){
        [touchCancelledObject performSelector:touchCancelledSelector withObject:self];
    }
}

-(void)dealloc
{
    NSLog(@"**********| %s dealloc message! |**********", object_getClassName(self));
    
    [super dealloc];
}

@end
