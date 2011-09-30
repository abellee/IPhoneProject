//
//  MTInfo.m
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MTInfo.h"

@implementation MTInfo

@synthesize infoString;

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
	NSLog(@"******| MTInfo |****** receive dealloc message!");
	[infoString release];
	infoString = nil;
	[super dealloc];
}

- (NSString *)infoString
{
	return infoString;
}

- (void)infoString:(NSString *)str
{
	if(infoString != str){
		[infoString release];
		infoString = [str retain];
	}
}

@end
