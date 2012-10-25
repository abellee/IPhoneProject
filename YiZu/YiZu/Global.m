//
//  Global.m
//  YiZu
//
//  Created by Abel Lee on 12-8-10.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "Global.h"
#import "RegexKitLite.h"
#import "PlayerData.h"

@implementation Global

@synthesize popUpLayer;
@synthesize serverInfo;
@synthesize socketManager;
@synthesize callback;
@synthesize gameLayer;
@synthesize userDataVersion;
@synthesize player;

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

+(BOOL)checkUsername:(NSString *)str
{
    return [str isMatchedByRegex:@"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"];
}

+(BOOL)checkPassword:(NSString *)str
{
    if(str.length < 6 || str.length > 40){
        return NO;
    }else{
        return YES;
    }
}

+(BOOL)checkNickname:(NSString *)str
{
    return [str isMatchedByRegex:[NSString stringWithFormat:@"[a-zA-Z\\d\\u4e00-\\u9fa5_\\-]{%d}?", [str length]]];
}

+(NSString*)gbencodingWithChar:(char*)str
{
    NSStringEncoding nsEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return [NSString stringWithCString:str encoding:nsEncoding];
}

@end
