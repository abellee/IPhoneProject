//
//  EmotionAction.m
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "EmotionAction.h"

@implementation EmotionAction

@synthesize emotionId;
@synthesize emotionName;
@synthesize emotionDescription;

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
	NSLog(@"******| EmotionAction |****** receive dealloc message!");
	[emotionName release];
	[emotionDescription release];
	emotionName = nil;
	emotionDescription = nil;
	[super dealloc];
}

- (NSString *)emotionDescription
{
	return emotionDescription;
}

- (void)emotionDescription:(NSString *)des
{
	if(emotionDescription != des){
		[emotionDescription release];
		emotionDescription = [des retain];
	}
}

- (int)emotionId
{
	return emotionId;
}

- (void)emotionId:(int)num
{
	if(emotionId != num) emotionId = num;
}

- (NSString *)emotionName
{
	return emotionName;
}

- (void)emotionName:(NSString *)emo
{
	if(emotionName != emo){
		[emotionName release];
		emotionName = [emo retain];
	}
}

@end
