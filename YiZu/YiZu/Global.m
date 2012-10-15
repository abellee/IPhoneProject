//
//  Global.m
//  YiZu
//
//  Created by Abel Lee on 12-8-10.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "Global.h"

@implementation Global

@synthesize popUpLayer;
@synthesize serverInfo;
@synthesize socketManager;

static Global *instance;

+(id)sharedGlobal{
    if(instance == nil){
        instance = [[self alloc] init];
    }
    return instance;
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
