//
//  Task.m
//  MovingTribal
//
//  Created by Lee Abel on 9/27/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "Task.h"

@implementation Task

@synthesize taskDescription;
@synthesize taskAward;
@synthesize taskName;
@synthesize taskPublisher;
@synthesize taskRequirement;
@synthesize taskType;
@synthesize taskPublishTime;
@synthesize taskExpireTime;
@synthesize isExpired;
@synthesize completion;

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
	NSLog(@"******| Task |****** receive dealloc message!");
	[taskDescription release];
	[taskAward release];
	[taskName release];
	[taskPublisher release];
	[taskRequirement release];
	taskDescription = nil;
	taskAward = nil;
	taskName = nil;
	taskPublisher = nil;
	taskRequirement = nil;
	[super dealloc];
}

- (NSString *)taskDescription
{
	return taskDescription;
}

- (void)taskDescription:(NSString *)str
{
	if(taskDescription != str){
		[taskDescription release];
		taskDescription = [str retain];
	}
}

- (NSString *)taskAward
{
	return taskAward;
}

- (void)taskAward:(NSString *)str
{
	if(taskAward != str){
		[taskAward release];
		taskAward = [str retain];
	}
}

- (NSString *)taskName
{
	return taskName;
}

- (void)taskName:(NSString *)str
{
	if(taskName != str){
		[taskName release];
		taskName = [str retain];
	}
}

- (NSString *)taskPublisher
{
	return taskPublisher;
}

- (void)taskPublisher:(NSString *)str
{
	if(taskPublisher != str){
		[taskPublisher release];
		taskPublisher = [str retain];
	}
}

- (NSDictionary *)taskRequirement
{
	return taskRequirement;
}

- (void)taskRequirement:(NSDictionary *)dic
{
	if(taskRequirement != dic){
		[taskRequirement release];
		taskRequirement = [dic retain];
	}
}

- (int)taskType
{
	return taskType;
}

- (void)taskType:(int)num
{
	if(taskType != num){
		taskType = num;
	}
}

- (int)taskPublishTime
{
	return taskPublishTime;
}

- (void)taskPublishTime:(int)time
{
	if(taskPublishTime != time){
		taskPublishTime = time;
	}
}

- (int)taskExpireTime
{
	return taskExpireTime;
}

- (void)taskExpireTime:(int)time
{
	if(taskExpireTime != time){
		taskExpireTime = time;
	}
}

- (BOOL)isExpired
{
	return isExpired;
}

- (void)isExpired:(BOOL)bo
{
	if(isExpired != bo){
		isExpired = bo;
	}
}

- (BOOL)completion
{
	return completion;
}

- (void)completion:(BOOL)bo
{
	if(completion != bo){
		completion = bo;
	}
}

@end
