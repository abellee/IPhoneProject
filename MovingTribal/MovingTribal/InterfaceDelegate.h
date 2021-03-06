//
//  InterfaceDelegate.h
//  MovingTribal
//
//  Created by Lee Abel on 9/13/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"
#import "Task.h"

@protocol InterfaceDelegate <NSObject>

- (void)showMainContainer;
- (void)showChatInterface:(UserData *)userData;
- (void)exitChatInterface;
- (void)changeTitle:(NSInteger)tag;
- (void)showProfileInterface:(UserData *)userData;
- (void)showAbleTaskInterfaceWithUserData:(UserData *)userData;
- (void)showTaskDetailWithTaskData:(Task *)taskData withUserData:(UserData *)userData;
- (void)showEmotionListWithUserData:(UserData *)userData;

@end
