//
//  TransitionVariable.m
//  MovingTribal
//
//  Created by Lee Abel on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TransitionVariable.h"

@implementation TransitionVariable

@synthesize subType;
@synthesize duration;
@synthesize view;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"******| TransitionVariable |****** receive dealloc message!");
    [subType release];
    [view release];
    [super dealloc];
}

- (NSString *)subType
{
    return subType;
}

- (void)subType:(NSString *)str
{
    if(subType != str){
        NSString* tempStr = subType;
        subType = [str copy];
        [tempStr release];
    }
}

- (CGFloat)duration
{
    return duration;
}

- (void)duration:(CGFloat)value
{
    if(value != duration) duration = value;
}

- (UIView *)view
{
    return view;
}

- (void)view:(UIView *)v
{
    if(view != v){
        UIView* tempView = view;
        view = [v retain];
        [tempView release];
    }
}

@end
