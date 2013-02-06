//
//  ServerInfo.m
//  YiZu
//
//  Created by Lee Abel on 12-8-24.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "ServerInfo.h"
#import "JSONKit.h"

@implementation ServerInfo

@synthesize ip;
@synthesize port;

-(void)parse:(NSString *)data
{
    NSDictionary* dict = [data objectFromJSONString];
    ip = [dict valueForKey:@"ip"];
    port = [[dict valueForKey:@"port"] intValue];
}

-(void)dealloc
{
    [ip release];
    ip = nil;
    [super dealloc];
}

@end
