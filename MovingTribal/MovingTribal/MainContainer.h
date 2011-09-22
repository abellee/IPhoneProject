//
//  MainContainer.h
//  MovingTribal
//
//  Created by Lee Abel on 9/17/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MainContainerDelegate.h"
#import "InterfaceDelegate.h"

#import "MapInterface.h"
#import "SystemSettingInterface.h"
#import "SearchableListInterface.h"

@interface MainContainer : UIViewController<MainContainerDelegate, UITabBarDelegate>{
    id<InterfaceDelegate> delegate;
    
    MapInterface* mapInterface;
    SearchableListInterface* chatListInterface;
    SearchableListInterface* friendInterface;
    SystemSettingInterface* systemSettingInterface;
    
    UITabBar* tabBar;
}

@property (nonatomic, assign) id<InterfaceDelegate> delegate;
@property (nonatomic, assign) MapInterface* mapInterface;
@property (nonatomic, assign) SearchableListInterface* chatListInterface;
@property (nonatomic, assign) SearchableListInterface* friendInterface;
@property (nonatomic, assign) SystemSettingInterface* systemSettingInterface;

@property (nonatomic, retain) UITabBar* tabBar;

- (void)editCell;

@end
