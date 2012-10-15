//
//  ServerInfo.h
//  YiZu
//
//  Created by Lee Abel on 12-8-24.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"

@interface ServerInfo : NSObject{
    NSString* ip;
    int port;
}

@property (nonatomic, retain) NSString* ip;
@property (nonatomic, assign) int port;

-(void)parse:(NSString *)data;

@end
