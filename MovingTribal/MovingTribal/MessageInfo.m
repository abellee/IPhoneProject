//
//  MessageInfo.m
//  MovingTribal
//
//  Created by Lee Abel on 9/30/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MessageInfo.h"

@implementation MessageInfo

@synthesize type;
@synthesize text;
@synthesize from;
@synthesize time;

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
	NSLog(@"******| MessageInfo |****** receive dealloc message!");
	[text release];
	[from release];
	[time release];
	text = nil;
	from = nil;
	time = nil;
	[super dealloc];
}

- (MessageType)type
{
	return type;
}

- (void)type:(MessageType)t
{
	if(type != t) type = t;
}

- (NSString *)text
{
	return text;
}

- (void)text:(NSString *)str
{
	if(text != str){
		[text release];
		text = [str retain];
	}
}

- (UserData *)from
{
	return from;
}

- (void)from:(UserData *)ud
{
	if(from != ud){
		[from release];
		from = [ud retain];
	}
}

- (NSDate *)time
{
	return time;
}

- (void)time:(NSDate *)t
{
	if(time != t){
		[time release];
		time = [t retain];
	}
}

@end
