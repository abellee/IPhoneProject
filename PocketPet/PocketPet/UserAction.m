//
//  UserAction.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-26.
//
//

#import "UserAction.h"
#import "Utils.h"
#import "Global.h"
#import "JSONKit.h"
#import "FileManager.h"

@implementation UserAction

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [fileManager release];
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        fileManager = [[FileManager alloc] init];
    }
    return self;
}

- (void)userOperation:(int)code
{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:code forKey:@"code"];
    [dict setObject:[Utils secTimeSince1970] forKey:@"time"];
    NSString* str = [dict JSONString];
    [dict release];
    [fileManager writeUserLog:str];
}

- (void)userOperation:(int)code andInfo:(NSString *)info
{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:code forKey:@"code"];
    [dict setObject:[Utils secTimeSince1970] forKey:@"time"];
    [dict setObject:info forKey:@"info"];
    NSString* str = [dict JSONString];
    [dict release];
    [fileManager writeUserLog:str];
}

@end
