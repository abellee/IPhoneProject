//
//  MainContainerDelegate.h
//  MovingTribal
//
//  Created by Lee Abel on 9/17/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"

@protocol MainContainerDelegate <NSObject>

@required
- (void)showChatInterface:(UserData *)userData;

@end
