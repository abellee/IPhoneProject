//
//  AppDelegate.h
//  YiZu
//
//  Created by Abel Lee on 12-6-14.
//  Copyright Abel 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
