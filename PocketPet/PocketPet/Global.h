//
//  Global.h
//  YiZu
//
//  Created by Abel Lee on 12-8-10.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@class SocketManager;
@class GameLayer;
@class PopUpLayer;
@class ServerInfo;
@class PP_CLUser;
@class CCSprite;
@class BattleFieldLayer;
@class VersionChecker;
@interface Global : NSObject{
    PopUpLayer *popUpLayer;
    ServerInfo *serverInfo;
    SocketManager *socketManager;
    GameLayer* gameLayer;
    NSString* callback;
    int userDataVerion;
    PP_CLUser* player;
    NSString* imageSuffix;
    BattleFieldLayer* battleField;
    
    NSString* appId;
    NSUInteger lastVersionCheck;
    VersionChecker* versionChecker;
}

@property (nonatomic, retain, getter = popUpLayer, setter = popUpLayer:) PopUpLayer *popUpLayer;
@property (nonatomic, retain, getter = socketManager, setter = socketManager:) SocketManager *socketManager;
@property (nonatomic, retain, getter = gameLayer, setter = gameLayer:) GameLayer* gameLayer;
@property (nonatomic, retain, getter = callback, setter = callback:) NSString* callback;
@property (nonatomic, assign, getter = userDataVersion, setter = userDataVersion:) int userDataVersion;
@property (nonatomic, retain, getter = player, setter = player:) PP_CLUser* player;
@property (nonatomic, retain, getter = imageSuffix, setter = imageSuffix:) NSString* imageSuffix;
@property (nonatomic, assign, getter = battleField, setter = battleField:) BattleFieldLayer* battleField;
@property (nonatomic, retain, getter = getAppId, setter = setAppId:) NSString* appId;
@property (nonatomic, getter = getLastVersionCheck, setter = setLastVersionCheck:) NSUInteger lastVersionCheck;
@property (nonatomic, retain, getter = serverInfo, setter = serverInfo:) ServerInfo *serverInfo;

+(id)sharedGlobal;
+ (NSString *)md5:(NSString *)str;
+ (BOOL)checkUsername:(NSString *)str;
+ (BOOL)checkPassword:(NSString *)str;
+ (BOOL)checkNickname:(NSString *)str;
+ (NSString *)gbencodingWithChar:(char*)str;
+ (CCSprite*)overlayCCSprite:(CCSprite*)sprite color:(UIColor*)color;

-(NSString*)getImageName:(NSString*)name type:(NSString*)type;
-(void)checkVersion;
-(void)checkVersionFinish;
-(void)setServerInfoWithIP:(NSString*)ip port:(int)port;

@end
