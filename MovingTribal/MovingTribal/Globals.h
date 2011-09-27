//
//  Globals.h
//  MovingTribal
//
//  Created by Lee Abel on 9/25/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"

@interface Globals : NSObject

+ (NSString *)root;
+ (NSString *)md5:(NSString *)str;
+ (void)setUserData:(UserData *)data;
+ (UserData*)getUserData;

@end
