//
//  TransitionVariable.h
//  MovingTribal
//
//  Created by Lee Abel on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransitionVariable : NSObject{
    NSString* subType;
    CGFloat duration;
    UIView* view;
}

@property (nonatomic, assign, getter = subType, setter = subType:) NSString* subType;
@property (nonatomic, assign, getter = duration, setter = duration:) CGFloat duration;
@property (nonatomic, assign, getter = view, setter = view:) UIView* view;

@end
