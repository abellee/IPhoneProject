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

@end
