//
//  Global.h
//  YiZu
//
//  Created by Abel Lee on 12-8-10.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PopUpLayer.h"
#import "SocketManager.h"
#import "ServerInfo.h"
#import <CommonCrypto/CommonDigest.h>

@class SocketManager;
@interface Global : NSObject{
    PopUpLayer *popUpLayer;
    ServerInfo *serverInfo;
    SocketManager *socketManager;
}

@property (nonatomic, retain)PopUpLayer *popUpLayer;
@property (nonatomic, retain)ServerInfo *serverInfo;
@property (nonatomic, retain)SocketManager *socketManager;

+(id)sharedGlobal;
+ (NSString *)md5:(NSString *)str;

@end
