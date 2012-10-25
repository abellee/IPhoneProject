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
@class PlayerData;
@interface Global : NSObject{
    PopUpLayer *popUpLayer;
    ServerInfo *serverInfo;
    SocketManager *socketManager;
    GameLayer* gameLayer;
    NSString* callback;
    int userDataVerion;
    PlayerData* player;
}

@property (nonatomic, retain, getter = popUpLayer, setter = popUpLayer:) PopUpLayer *popUpLayer;
@property (nonatomic, retain, getter = serverInfo, setter = serverInfo:) ServerInfo *serverInfo;
@property (nonatomic, retain, getter = socketManager, setter = socketManager:) SocketManager *socketManager;
@property (nonatomic, retain, getter = gameLayer, setter = gameLayer:) GameLayer* gameLayer;
@property (nonatomic, retain, getter = callback, setter = callback:) NSString* callback;
@property (nonatomic, assign, getter = userDataVersion, setter = userDataVersion:) int userDataVersion;
@property (nonatomic, retain, getter = player, setter = player:) PlayerData* player;

+(id)sharedGlobal;
+ (NSString *)md5:(NSString *)str;
+ (BOOL)checkUsername:(NSString *)str;
+ (BOOL)checkPassword:(NSString *)str;
+ (BOOL)checkNickname:(NSString *)str;
+ (NSString *)gbencodingWithChar:(char*)str;

@end
