//
//  HTTPManager.h
//  YiZu
//
//  Created by Lee Abel on 12-8-24.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ServerInfo;

@interface HTTPManager : NSObject

+(id)sharedHTTPManager;
-(BOOL)getSocketServerInfo;

@end
