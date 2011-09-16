//
//  MovingTribalController.h
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "RegistInterface.h"
#import "LoginInterface.h"
#import "OthersLoginInterface.h"
#import "MapInterface.h"
#import "ChatInterface.h"
#import "FriendsInterface.h"
#import "SystemSettingInterface.h"
#import "ChatListInterface.h"

@interface MovingTribalController : UIViewController<InterfaceDelegate, UITabBarDelegate>{
    RegistInterface* registInterface;
    LoginInterface* loginInterface;
    OthersLoginInterface* othersInterface;
    MapInterface* mapInterface;
    ChatInterface* chatInterface;
    ChatListInterface* chatListInterface;
    FriendsInterface* friendInterface;
    SystemSettingInterface* systemSettingInterface;
    
    UITabBar* tabBar;
    
    UIView* currentView;
    
    NSUInteger currentState;
}
@property (nonatomic, assign) RegistInterface* registInterface;
@property (nonatomic, assign) LoginInterface* loginInterface;
@property (nonatomic, assign) OthersLoginInterface* othersInterface;
@property (nonatomic, assign) MapInterface* mapInterface;
@property (nonatomic, assign) ChatInterface* chatInterface;
@property (nonatomic, assign) ChatListInterface* chatListInterface;
@property (nonatomic, assign) FriendsInterface* friendInterface;
@property (nonatomic, assign) SystemSettingInterface* systemSettingInterface;

@property (nonatomic, retain) UITabBar* tabBar;

@property (nonatomic, retain) UIView* currentView;
@property (nonatomic, assign) NSUInteger currentState;

- (void)showLoginInterface;
- (void)easeOut:(UIView *)view;
- (void)easeIn:(UIView *)view;

@end
