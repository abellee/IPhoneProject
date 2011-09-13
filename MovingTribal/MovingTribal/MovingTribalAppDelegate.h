//
//  MovingTribalAppDelegate.h
//  MovingTribal
//
//  Created by Lee Abel on 9/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovingTribalController;

@interface MovingTribalAppDelegate : UIResponder <UIApplicationDelegate>{
    MovingTribalController* movingTribal;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) MovingTribalController *movingTribal;

@end
