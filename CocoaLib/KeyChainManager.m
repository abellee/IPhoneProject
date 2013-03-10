//
//  KeyChainManager.m
//  CocoaLib
//
//  Created by Lee Abel on 13-3-8.
//  Copyright (c) 2013年 Abel. All rights reserved.
//

#import "KeyChainManager.h"

@implementation KeyChainManager

static NSString* default_service;

- (id) init
{
    if (self = [super init]) {
        default_service = [[NSBundle mainBundle] bundleIdentifier];
    }
    return self;
}

+ (id)sharedManager
{
    return [[[self alloc] init] autorelease];
}

- (BOOL)setString:(NSString *)value forKey:(NSString *)key
{
    if ([self getStringWithAccount:key] == nil) {
        NSData* valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
        NSMutableDictionary* dict = [self configureWithAccount:key];
        [dict setObject:valueData forKey:(id)kSecValueData];
        OSStatus status = SecItemAdd((CFDictionaryRef)dict, NULL);
        if (status == noErr) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return [self updateString:value forKey:key];
    }
}

- (NSString*)getStringWithAccount:(NSString *)account
{
    NSMutableDictionary* dict = [self configureWithAccount:account];
    [dict setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [dict setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    
    NSData* returnData = nil;
    OSStatus status = SecItemCopyMatching((CFDictionaryRef)dict, (CFTypeRef*)&returnData);
    if (status == noErr && returnData) {
        NSString* str = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
        [returnData release];
        return [str autorelease];
    }else{
        return nil;
    }
}

- (BOOL)updateString:(NSString *)value forKey:(NSString*)key
{
    NSData* valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableDictionary* dict = [self configureWithAccount:key];
    NSMutableDictionary* updateDict = [[NSMutableDictionary alloc] init];
    [updateDict setObject:valueData forKey:(id)kSecValueData];
    
    OSStatus status = SecItemUpdate((CFDictionaryRef)dict, (CFDictionaryRef)updateDict);
    [updateDict release];
    if (status == noErr) {
        return YES;
    }else{
        return NO;
    }
}

- (NSArray*)getItems
{
    NSMutableDictionary* dict = [self configure];
    [dict setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [dict setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnAttributes];
    [dict setObject:(id)kSecMatchLimitAll forKey:(id)kSecMatchLimit];
    
    CFArrayRef returnData = nil;
    
    OSStatus status = SecItemCopyMatching((CFDictionaryRef)dict, (CFTypeRef*)&returnData);
    if (status == noErr && returnData) {
        NSArray* tempArray = (NSArray*)returnData;
        return [tempArray autorelease];
    }
    return nil;
}

- (BOOL)deleteKeyChain
{
    NSMutableDictionary* dict = [self configure];
    OSStatus status = SecItemDelete((CFDictionaryRef)dict);
    if (status == noErr) {
        return YES;
    }else{
        return NO;
    }
}

- (NSMutableDictionary*)configureWithAccount:(NSString*)account
{
    NSData* keyData = [account dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    [dict setObject:(id)kSecAttrAccessibleWhenUnlocked forKey:(id)kSecAttrAccessible];
    [dict setObject:default_service forKey:(id)kSecAttrService];
    [dict setObject:keyData forKey:(id)kSecAttrGeneric];
    [dict setObject:keyData forKey:(id)kSecAttrAccount];
    
    return [dict autorelease];
}

- (NSMutableDictionary*)configure
{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    [dict setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    [dict setObject:(id)kSecAttrAccessibleWhenUnlocked forKey:(id)kSecAttrAccessible];
    [dict setObject:default_service forKey:(id)kSecAttrService];
    return [dict autorelease];
}

@end
