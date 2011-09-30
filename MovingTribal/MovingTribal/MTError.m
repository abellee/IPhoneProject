//
//  MTError.m
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MTError.h"

@implementation MTError

@synthesize errorCode;

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
	NSLog(@"******| MTError |****** receive dealloc message!");
	[super dealloc];
}

- (int)errorCode
{
	return errorCode;
}

- (void)errorCode:(int)num
{
	if(errorCode != num) errorCode = num;
}

@end
