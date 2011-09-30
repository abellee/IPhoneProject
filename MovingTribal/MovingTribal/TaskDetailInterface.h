//
//  TaskDetailInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InterfaceDelegate.h"
#import "Task.h"

@interface TaskDetailInterface : UIViewController<UITableViewDelegate, UITableViewDataSource, UIAccelerometerDelegate, UIAlertViewDelegate>{
	id<InterfaceDelegate> delegate;
	UserData* userData;
	Task* taskData;
	UITableViewController* taskTable;
	UIImageView* taskIcon;
	UILabel* taskName;
	UILabel* taskRequirement;
	UILabel* taskDescription;
	UILabel* taskPublisher;
	UILabel* taskAward;
	UILabel* taskLimitTime;
	UIButton* runButton;
	NSArray* sectionNames;
	
	BOOL left;
	BOOL right;
}

@property (nonatomic, assign) id<InterfaceDelegate> delegate;
@property (nonatomic, assign) UserData* userData;
@property (nonatomic, assign) Task* taskData;
@property (nonatomic, retain) UITableViewController* taskTable;
@property (nonatomic, retain) UIImageView* taskIcon;
@property (nonatomic, retain) UILabel* taskName;
@property (nonatomic, retain) UILabel* taskRequirement;
@property (nonatomic, retain) UILabel* taskDescription;
@property (nonatomic, retain) UILabel* taskPublisher;
@property (nonatomic, retain) UILabel* taskAward;
@property (nonatomic, retain) UILabel* taskLimitTime;
@property (nonatomic, retain) UIButton* runButton;
@property (nonatomic, assign) NSArray* sectionNames;
@property (nonatomic, assign) BOOL left;
@property (nonatomic, assign) BOOL right;

- (id)initWithTaskData:(Task *)task userData:(UserData *)data;

@end
