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
#import "Global.h"
#import "PP_Package.h"
#import "HTTPManager.h"
#import "ServerInfo.h"

@interface SocketManager : NSObject{
    NSThread* thread;
    //NSThread* hbThread;
    
    int sockfd;
    struct sockaddr_in addr;
}

@property (nonatomic, retain) NSThread* thread;
//@property (nonatomic, retain) NSThread* hbThread;

-(void)connect;
-(void)test;
-(void)backgroundTest;
-(void)foregroundTest;
-(void)doLogin:(NSString*)username pass:(NSString*)password;

@end
