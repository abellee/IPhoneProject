//
//  KeyChainManager.h
//  CocoaLib
//
//  Created by Lee Abel on 13-3-8.
//  Copyright (c) 2013年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface KeyChainManager : NSObject 

+ (id)sharedManager;
- (BOOL)setString:(NSString*)value forKey:(NSString *)key;
- (BOOL)updateString:(NSString *)value forKey:(NSString*)key;
- (NSString*)getStringWithAccount:(NSString*)account;
- (NSArray*)getItems;
- (BOOL)deleteKeyChain;

@end
