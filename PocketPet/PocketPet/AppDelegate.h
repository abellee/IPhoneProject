//
//  AppDelegate.h
//  PocketPet
//
//  Created by Lee Abel on 12-12-28.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;

//@property (nonatomic, retain, readonly) NSManagedObjectContext* managedObjectContext;
//@property (nonatomic, retain, readonly) NSManagedObjectModel* managedObjectModel;
//@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator* persistentStoreCoordinator;

//- (void)saveContext;
- (NSURL*)applicationDocumentsDirectory;

@end
