//
//  HTTPManager.m
//  YiZu
//
//  Created by Lee Abel on 12-8-24.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "HTTPManager.h"
#import "SystemConfig.h"
#import "JSONKit.h"
#import "Global.h"

@implementation HTTPManager

static HTTPManager* instance;

+(id)sharedHTTPManager
{
    if(instance == nil){
        instance = [[self alloc] init];
    }
    return instance;
}

-(BOOL) getSocketServerInfo
{
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", BASE_URL, DIR_NAME, @"socket_server.php"]];
    NSLog(@"%@", [url absoluteString]);
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLResponse* response;
    NSError* error;
    NSData* returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString* returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSDictionary* dict = [returnString objectFromJSONString];
    if (![dict objectForKey:@"ip"]) {
        return NO;
    }
    [[Global sharedGlobal] setServerInfoWithIP:[dict objectForKey:@"ip"] port:[[dict objectForKey:@"port"] intValue]];
    [returnString release];
    returnString = nil;
    return YES;
}

@end
