//
//  HTTPManager.m
//  YiZu
//
//  Created by Lee Abel on 12-8-24.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "HTTPManager.h"
#import "SystemConfig.h"
#import "ServerInfo.h"

@implementation HTTPManager

static HTTPManager* instance;

+(id)sharedHTTPManager
{
    if(instance == nil){
        instance = [[self alloc] init];
    }
    return instance;
}

-(ServerInfo *) getSocketServerInfo
{
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", BASE_URL, @"pocketpet", @"socket_server.php"]];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response;
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    ServerInfo* serverInfo = [[ServerInfo alloc] init];
    [serverInfo parse:returnString];
    [returnString release];
    returnString = nil;
    return [serverInfo autorelease];
}

@end
