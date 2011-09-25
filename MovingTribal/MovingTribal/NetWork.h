//
//  NetWork.h
//  MovingTribal
//
//  Created by Lee Abel on 9/25/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"
#import "Globals.h"

@interface NetWork : NSObject

+ (BOOL)sendText:(NSString *)text targetUser:(UserData *)userData;

@end
