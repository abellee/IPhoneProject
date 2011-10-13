//
//  TaskMessageInfo.m
//  MovingTribal
//
//  Created by Lee Abel on 9/30/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TaskMessageInfo.h"

@implementation TaskMessageInfo

@synthesize taskId;
@synthesize taskData;

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
	NSLog(@"******| |****** receive dealloc message!");
	[taskData release];
	taskData = nil;
	[super dealloc];
}

- (int)taskId
{
	return taskId;
}

- (void)taskId:(int)num
{
	if(taskId != num) taskId = num;
}

- (Task *)taskData
{
	return taskData;
}

- (void)taskData:(Task *)data
{
	if(taskData != data){
		[taskData release];
		taskData = [data retain];
	}
}

@end
