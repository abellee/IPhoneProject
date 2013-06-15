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
#import "Map.h"
#import "MapTileConfig.h"
#import "NSString+Extension.h"
#import "ResourceConfig.h"
#import "PointSprite.h"
#import "InstanceConfig.h"
#import "PetData.h"

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
@synthesize totalDataUse;
@synthesize totalHeight;
@synthesize totalWidth;
@synthesize heightInNavigator;
@synthesize isConnected, isIP5, isRetina, userAction, lastVersionCheck, appId, instanceList, mainPetList, petList, petTemplateDataList;

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

- (void)appId:(NSString *)idStr
{
    appId = idStr;
    [[NSUserDefaults standardUserDefaults] setValue:idStr forKey:@"appId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (int)totalHeight
{
    if (totalHeight <= 0) {
        totalHeight = [[UIScreen mainScreen] bounds].size.height;
    }
    return totalHeight;
}

- (int)totalWidth
{
    if (totalWidth <= 0) {
        totalWidth = [[UIScreen mainScreen] bounds].size.width;
    }
    return totalWidth;
}

- (int)heightInNavigator
{
    if (heightInNavigator <= 0) {
        heightInNavigator = [[UIScreen mainScreen] bounds].size.height - 44;
    }
    return heightInNavigator;
}

- (NSString*)appId
{
    if (appId == nil) {
        NSString* appIdStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"appId"];
        if (appIdStr != nil) {
            appId = appIdStr;
        }
    }
    return appId;
}

- (void)lastVersionCheck:(NSUInteger)time
{
    lastVersionCheck = time;
    [[NSUserDefaults standardUserDefaults] setInteger:time forKey:@"lastVersionCheck"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSUInteger)lastVersionCheck
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

+ (CGPoint)pixelForTile:(CGPoint)point inMap:(Map *)map
{
    int cellWidth = map.cellWidth;
    int cellHeight = map.cellHeight;
    float xpos = cellWidth * point.x / [UIScreen mainScreen].scale;
    float ypos = cellHeight * point.y / [UIScreen mainScreen].scale;
    return CGPointMake(xpos, ypos);
}

+ (CGPoint)tileForPixel:(CGPoint)point inMap:(Map *)map
{
    int cellWidth = map.cellWidth / [UIScreen mainScreen].scale;
    int cellHeight = map.cellHeight / [UIScreen mainScreen].scale;
    int xpos = floor(point.x / cellWidth);
    int ypos = floor(point.y / cellHeight);
    return CGPointMake(xpos, ypos);
}

+ (CGPoint)coordinateToPixel:(CLLocation*)point inMap:(Map *)map
{
    CLLocation* startLocation = [[CLLocation alloc] initWithLatitude:map.startPoint.x longitude:map.startPoint.y];
    CLLocation* pointHor = [[CLLocation alloc] initWithLatitude:map.startPoint.x longitude:point.coordinate.longitude];
    CLLocationDistance horDis = [startLocation distanceFromLocation:pointHor];
    CLLocationDistance verDis = [point distanceFromLocation:pointHor];
    
    float horCellNum = horDis / map.metersPerSegment;
    float horPixelDis = map.pixelPerSegment * horCellNum * map.mapScale / [UIScreen mainScreen].scale;
    
    float verCellNum = verDis / map.metersPerSegment;
    float verPixelDis = map.pixelPerSegment * verCellNum * map.mapScale / [UIScreen mainScreen].scale;
    
    return CGPointMake(horPixelDis, verPixelDis);
}

+ (float)finalWidth:(float)width
{
    return width / [UIScreen mainScreen].scale;
}

+ (float)finalHeight:(float)height
{
    return height / [UIScreen mainScreen].scale;
}

+ (float)finalX:(float)xpos
{
    return xpos / [UIScreen mainScreen].scale;
}

+ (float)finalY:(float)ypos
{
    return ypos / [UIScreen mainScreen].scale;
}

- (void)initResourceConfig:(NSMutableArray *)types
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithCapacity:0];
    for (NSString* type in types) {
        NSMutableArray* resConfigArray = [NSMutableArray arrayWithCapacity:0];
        NSFileHandle* file = [NSFileHandle fileHandleForReadingAtPath:[NSString getPathStringWithFileName:type withExtension:@"rpd"]];
        [file seekToFileOffset:0];
        int imgNum;
        NSData* imgNumData = [file readDataOfLength:4];
        [imgNumData getBytes:&imgNum range:NSMakeRange(0, 4)];
        int dataLen = sizeof(int) * 3;
        for (int i = 0; i < imgNum; i++) {
            [file seekToFileOffset:4 + i * dataLen];
            NSData* configData = [file readDataOfLength:dataLen];
            int subtype;
            int imgDataIndex;
            int imgDataLength;
            [configData getBytes:&subtype range:NSMakeRange(0, sizeof(int))];
            [configData getBytes:&imgDataIndex range:NSMakeRange(sizeof(int), sizeof(int))];
            [configData getBytes:&imgDataLength range:NSMakeRange(sizeof(int) * 2, sizeof(int))];
            
            ResourceConfig* config = [[ResourceConfig alloc] init];
            [config subtype:subtype];
            [config imageDataIndex:imgDataIndex];
            [config imageDataLength:imgDataLength];
            [resConfigArray addObject:config];
            [config release];
        }
        [dict setObject:resConfigArray forKey:[NSString stringWithFormat:@"type%@", type]];
        [file closeFile];
    }
    [self resourceConfigDict:dict];
}

- (NSMutableArray*)getResourceConfigArrayWithType:(int)type
{
    return [[self resourceConfigDict] objectForKey:[NSString stringWithFormat:@"type%d", type]];
}

- (UIImage*)getResourceImageWithType:(int)type andSubtype:(int)subtype
{
    ResourceConfig* config = [self getResourceConfigByType:type andSubtype:subtype];
    if (config) {
        NSFileHandle* file = [NSFileHandle fileHandleForReadingAtPath:[NSString getPathStringWithFileName:[NSString stringWithFormat:@"%d", type] withExtension:@"rpd"]];
        [file seekToFileOffset:config.imageDataIndex];
        NSData* imgData = [file readDataOfLength:config.imageDataLength];
        UIImage* img = [UIImage imageWithData:imgData];
        [file closeFile];
        return img;
    }
    return nil;
}

- (ResourceConfig*)getResourceConfigByType:(int)type andSubtype:(int)subtype
{
    NSMutableArray* configArray = [self getResourceConfigArrayWithType:type];
    if (configArray && [configArray count]) {
        for (ResourceConfig* config in configArray) {
            if ([config subtype] == subtype) {
                return config;
            }
        }
        return nil;
    }
    return nil;
}

- (InstanceConfig*)getInstanceConfigByInstanceId:(int)instanceId
{
    if (instanceList == nil || instanceList.count == 0) {
        return nil;
    }
    for (InstanceConfig* instanceConfig in instanceList) {
        if (instanceConfig.instanceId == instanceId) {
            return instanceConfig;
        }
    }
    return nil;
}

- (InstanceConfig*)getMainPetConfigByPetId:(int)petId
{
    if (mainPetList == nil || mainPetList.count == 0) {
        return nil;
    }
    for (InstanceConfig* petConfig in mainPetList) {
        if (petConfig.instanceId == petId) {
            return petConfig;
        }
    }
    return nil;
}

- (InstanceConfig*)getPetConfigByPetId:(int)petId
{
    if (petList == nil || petList.count == 0) {
        return nil;
    }
    for (InstanceConfig* petConfig in petList) {
        if (petConfig.instanceId == petId) {
            return petConfig;
        }
    }
    return nil;
}

- (NSMutableArray*)getSystemPetByPetLevel:(int)level
{
    NSMutableArray* tempArray = [NSMutableArray arrayWithCapacity:0];
    for (PetData* petData in petTemplateDataList) {
        if ([petData sys_level] == level) {
            [tempArray addObject:petData];
        }
    }
    return tempArray;
}

@end
