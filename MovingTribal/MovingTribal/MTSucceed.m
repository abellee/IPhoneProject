//
//  MTSucceed.m
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MTSucceed.h"

@implementation MTSucceed

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
	NSLog(@"******| MTSucceed |****** receive dealloc message!");
	[super dealloc];
}

@end
