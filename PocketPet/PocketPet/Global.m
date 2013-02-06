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
#import "cocos2d.h"
#import "UIImage+Overlay.h"
#import "PPCCSprite.h"
#import "VersionChecker.h"
#import "ServerInfo.h"

@implementation Global

@synthesize popUpLayer;
@synthesize socketManager;
@synthesize callback;
@synthesize gameLayer;
@synthesize userDataVersion;
@synthesize player;
@synthesize imageSuffix;
@synthesize battleField;
@synthesize serverInfo;

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

+(CCSprite*)overlayCCSprite:(CCSprite *)sprite color:(UIColor *)color
{
    sprite.scale = 1.0f;
    sprite.position = ccp(sprite.contentSize.width / 2, sprite.contentSize.height / 2);
    CCRenderTexture* renderer = [CCRenderTexture renderTextureWithWidth:sprite.contentSize.width height:sprite.contentSize.height];
    [renderer begin];
    [sprite visit];
    [renderer end];
//    UIImage* tempImg = [UIImage imageWithData:[renderer getUIImageAsDataFromBuffer:kCCImageFormatPNG]];
//    tempImg = [tempImg imageWithOverlayColor:color];
//    CCTexture2D* texture = [[CCTexture2D alloc] initWithImage:tempImg];
//    if([sprite isKindOfClass:[PPCCSprite class]]){
//        sprite = [PPCCSprite spriteWithTexture:texture];
//    }else{
//        sprite = [CCSprite spriteWithTexture:texture];
//    }
//    [texture release];
    return sprite;
}

-(NSString*)getImageName:(NSString *)name type:(NSString *)type
{
    NSString* str = [NSString stringWithFormat:@"%@%@.%@", name, imageSuffix, type];
    NSLog(@"%@", str);
    return str;
}

- (void)setAppId:(NSString *)idStr
{
    appId = idStr;
    [[NSUserDefaults standardUserDefaults] setValue:idStr forKey:@"appId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)getAppId
{
    if (!appId) {
        NSString* appIdStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"appId"];
        if (appIdStr) {
            appId = appIdStr;
        }
    }
    return appId;
}

- (void)setLastVersionCheck:(NSUInteger)time
{
    lastVersionCheck = time;
    [[NSUserDefaults standardUserDefaults] setInteger:time forKey:@"lastVersionCheck"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSUInteger)getLastVersionCheck
{
    if (!lastVersionCheck) {
        NSUInteger time = [[NSUserDefaults standardUserDefaults] integerForKey:@"lastVersionCheck"];
        if (time) {
            lastVersionCheck = time;
        }
    }
    return lastVersionCheck;
}

- (void)checkVersion
{
    if (versionChecker == nil) {
        versionChecker = [[VersionChecker alloc] init];
    }
    [versionChecker versionCheck];
}

- (void)checkVersionFinish
{
    if (versionChecker) {
        [versionChecker release];
        versionChecker = nil;
    }
}

- (void)setServerInfoWithIP:(NSString *)ip port:(int)port
{
    if (serverInfo == nil) {
        serverInfo = [[ServerInfo alloc] init];
    }
    [serverInfo setIp:ip];
    [serverInfo setPort:port];
}

@end
