//
//  SocketManager.h
//  YiZu
//
//  Created by Lee Abel on 12-8-25.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/types.h>
#import <sys/socket.h>
#import <unistd.h>
#import <arpa/inet.h>
#import <netdb.h>
#import <stdio.h>

@class ServerInfo;
@class Global;
@class HTTPManager;

@interface SocketManager : NSObject{
    NSThread* thread;
    //NSThread* hbThread;
    
    int sockfd;
    struct sockaddr_in addr;
}

@property (nonatomic, retain) NSThread* thread;
//@property (nonatomic, retain) NSThread* hbThread;

-(void)connect;
-(void)backgroundTest;
-(void)foregroundTest;
-(void)doLogin:(NSString*)username pass:(NSString*)password;
-(void)doRegist:(NSString*)avatarURL nickname:(NSString*)nickname username:(NSString*)username password:(NSString*)password;

@end
