//
//  Global.h
//  YiZu
//
//  Created by Abel Lee on 12-8-10.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CoreLocation/CoreLocation.h>

#define MAP_CELL_DEF @"map"

@class SocketManager;
@class GameLayer;
@class PopUpLayer;
@class ServerInfo;
@class PP_CLUser;
@class CCSprite;
@class BattleFieldLayer;
@class VersionChecker;
@class Map;
@class ResourceConfig;
@class ASINetworkQueue;
@class UserAction;
@class InstanceConfig;
@interface Global : NSObject
{
    VersionChecker* versionChecker;
}

@property (nonatomic, retain, getter = callback, setter = callback:) NSString* callback;
@property (nonatomic, retain, getter = imageSuffix, setter = imageSuffix:) NSString* imageSuffix;
@property (nonatomic, retain, getter = appId, setter = appId:) NSString* appId;
@property (nonatomic, retain, getter = resourceConfigDict, setter = resourceConfigDict:) NSMutableDictionary* resourceConfigDict;
@property (nonatomic, getter = lastVersionCheck, setter = lastVersionCheck:) NSUInteger lastVersionCheck;
@property (nonatomic, retain, getter = instanceList, setter = instanceList:) NSMutableArray* instanceList;
@property (nonatomic, retain, getter = mainPetList, setter = mainPetList:) NSMutableArray* mainPetList;
@property (nonatomic, retain, getter = petList, setter = petList:) NSMutableArray* petList;
@property (nonatomic, retain, getter = petTemplateDataList, setter = petTemplateDataList:) NSMutableArray* petTemplateDataList;
@property (nonatomic, copy, getter = duid, setter = duid:) NSString* duid;

@property (nonatomic, retain, getter = serverInfo, setter = serverInfo:) ServerInfo *serverInfo;
@property (nonatomic, retain, getter = httpQueue, setter = httpQueue:) ASINetworkQueue* httpQueue;
@property (nonatomic, retain, getter = userAction, setter = userAction:) UserAction* userAction;
@property (nonatomic, assign, getter = battleField, setter = battleField:) BattleFieldLayer* battleField;
@property (nonatomic, retain, getter = player, setter = player:) PP_CLUser* player;
@property (nonatomic, retain, getter = popUpLayer, setter = popUpLayer:) PopUpLayer *popUpLayer;
@property (nonatomic, retain, getter = socketManager, setter = socketManager:) SocketManager *socketManager;
@property (nonatomic, retain, getter = gameLayer, setter = gameLayer:) GameLayer* gameLayer;

@property (nonatomic, assign, getter = totalDataUse, setter = totalDataUse:) int totalDataUse;
@property (nonatomic, assign, getter = isConnected, setter = isConnected:) BOOL isConnected;
@property (nonatomic, assign, getter = totalHeight, setter = totalHeight:) int totalHeight;
@property (nonatomic, assign, getter = totalWidth, setter = totalWidth:) int totalWidth;
@property (nonatomic, assign, getter = heightInNavigator, setter = heightInNavigator:) int heightInNavigator;
@property (nonatomic, assign, getter = isRetina, setter = isRetina:) BOOL isRetina;
@property (nonatomic, assign, getter = isIP5, setter = isIP5:) BOOL isIP5;
@property (nonatomic, assign, getter = userDataVersion, setter = userDataVersion:) int userDataVersion;

+ (id)sharedGlobal;
+ (NSString *)md5:(NSString *)str;
+ (BOOL)checkUsername:(NSString *)str;
+ (BOOL)checkPassword:(NSString *)str;
+ (BOOL)checkNickname:(NSString *)str;
+ (NSString *)gbencodingWithChar:(char*)str;
+ (CCSprite*)overlayCCSprite:(CCSprite*)sprite color:(UIColor*)color;
+ (CGPoint)pixelForTile:(CGPoint)point inMap:(Map*)map;
+ (CGPoint)tileForPixel:(CGPoint)point inMap:(Map*)map;
+ (CGPoint)coordinateToPixel:(CLLocation*)point inMap:(Map*)map;
+ (float)finalWidth:(float)width;
+ (float)finalHeight:(float)height;
+ (float)finalX:(float)xpos;
+ (float)finalY:(float)ypos;

- (NSString*)getImageName:(NSString*)name type:(NSString*)type;
- (void)checkVersion;
- (void)checkVersionFinish;
- (void)setServerInfoWithIP:(NSString*)ip port:(int)port;
- (void)initResourceConfig:(NSMutableArray*)types;
- (NSMutableArray*)getResourceConfigArrayWithType:(int)type;
- (UIImage*)getResourceImageWithType:(int)type andSubtype:(int)subtype;
- (ResourceConfig*)getResourceConfigByType:(int)type andSubtype:(int)subtype;
- (InstanceConfig*)getInstanceConfigByInstanceId:(int)instanceId;
- (InstanceConfig*)getMainPetConfigByPetId:(int)petId;
- (InstanceConfig*)getPetConfigByPetId:(int)petId;
- (NSMutableArray*)getSystemPetByPetLevel:(int)level;

@end
