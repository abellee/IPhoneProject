//
//  KYDAppDelegate.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDAppDelegate.h"
#import "KYDViewController.h"
#import "KeyChainManager.h"
#import "KYDUser.h"
#import "Global.h"
#import "Definitions.h"

@implementation KYDAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    KeyChainManager* keychainManager = [KeyChainManager sharedManager];
    NSString* username = [keychainManager getStringWithAccount:@"username"];
    NSString* password = [keychainManager getStringWithAccount:@"password"];
    KYDUser* user = [[KYDUser alloc] init];
    [user username:username];
    [user password:password];
    [[Global sharedInstance] kydUser:user];
    [user release];
    
    if (FULL_HEIGHT > 560 && [[UIDevice currentDevice] userInterfaceIdiom] == 0) {
        [[Global sharedInstance] isIPhone5: YES];
    }else{
        [[Global sharedInstance] isIPhone5: NO];
    }
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[KYDViewController alloc] init] autorelease];
    [self.viewController.view setFrame:CGRectMake(0, 20, self.window.frame.size.width, self.window.frame.size.height)];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
