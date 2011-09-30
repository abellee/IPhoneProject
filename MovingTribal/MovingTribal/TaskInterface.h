//
//  TaskInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterfaceDelegate.h"
#import "UserData.h"

@interface TaskInterface : UIViewController<UITableViewDelegate, UITableViewDataSource>{
	id<InterfaceDelegate> delegate;
	UserData* userData;
	UITableViewController* tasksTable;
	NSArray* tasks;
}

@property (nonatomic, assign) id<InterfaceDelegate>delegate;
@property (nonatomic, assign) UserData* userData;
@property (nonatomic, retain) UITableViewController* tasksTable;
@property (nonatomic, assign) NSArray* tasks;

- (id)initWithTasks:(NSArray *)arr userData:(UserData *)data;

@end
