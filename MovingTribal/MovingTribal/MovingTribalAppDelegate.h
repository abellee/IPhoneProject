//
//  MovingTribalAppDelegate.h
//  MovingTribal
//
//  Created by Lee Abel on 9/11/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovingTribalController.h"
#import "Globals.h"
#import "TaskMessageInfo.h"
#import "NotificationType.h"

@class MovingTribalController;

@interface MovingTribalAppDelegate : UIResponder <UIApplicationDelegate>{
    MovingTribalController* movingTribal;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) MovingTribalController *movingTribal;

@end
