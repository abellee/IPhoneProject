//
//  Globals.m
//  MovingTribal
//
//  Created by Lee Abel on 9/25/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "Globals.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Globals

static UserData* userData;
static System* mainSystem;
static MessageCenter* messageCenter;
static NSString* root = @"172.16.11.40/forios";

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (MessageCenter *)getMessageCenter
{
	if(messageCenter == nil){
		messageCenter = [[MessageCenter alloc] init];
	}
	return messageCenter;
}

+ (System *)getMainSystem
{
	if(mainSystem == nil){
		mainSystem = [[System alloc] init];
	}
	return mainSystem;
}

+ (UserData *)getUserData
{
	return userData;
}

+ (void)setUserData:(UserData *)data
{
	if(userData != data){
		[userData release];
		userData = [data retain];
	}
}

+ (NSString *)root
{
	return root;
}

+(NSString *)md5:(NSString *)str { 
    const char *cStr = [str UTF8String]; 
    unsigned char result[CC_MD5_DIGEST_LENGTH]; 
    CC_MD5(cStr, strlen(cStr), result);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
		[output appendFormat:@"%02x",result[i]];
	return output;
}



@end
