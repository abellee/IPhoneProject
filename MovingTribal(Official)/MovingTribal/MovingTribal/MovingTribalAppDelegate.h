//
//  MovingTribalAppDelegate.h
//  MovingTribal
//
//  Created by Abel Lee on 10/13/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovingTribalController.h"
#import "Config.h"

@interface MovingTribalAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) MovingTribalController *movingTribal;

@end
