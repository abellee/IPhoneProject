//
//  DataGetter.h
//  MovingTribal
//
//  Created by Lee Abel on 9/19/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataGetter : NSObject{
    NSTimer* timer;
    
    int currentTimes;
}

@property (nonatomic, assign)NSTimer* timer;
@property (nonatomic, assign)int currentTimes;

- (void)initTimer;

@end
