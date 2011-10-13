//
//  TaskEntry.h
//  MovingTribal
//
//  Created by Lee Abel on 10/1/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskEntryDelegate.h"
#import "Task.h"
#import "UserData.h"
#import "EntryBelong.h"
#import "Globals.h"

@interface TaskEntry : UIViewController{
	id<TaskEntryDelegate> delegate;
	Task* task;
	UserData* userData;
	UILabel* label;
	UIButton* taskButton;
	UIImageView* avatar;
	UIView* background;
	
	CGSize entrySize;
	ckEntryBelong belong;
}

@property (nonatomic, assign) id<TaskEntryDelegate> delegate;
@property (nonatomic, assign) Task* task;
@property (nonatomic, assign) UserData* userData;
@property (nonatomic, assign) ckEntryBelong belong;
@property (nonatomic, assign) UILabel* label;
@property (nonatomic, assign) UIButton* taskButton;
@property (nonatomic, assign) UIImageView* avatar;
@property (nonatomic, assign) UIView* background;
@property (nonatomic, assign) CGSize entrySize;

- (id)initWithCustomBackground:(UIView *)view taskData:(Task *)taskData userData:(UserData *)ud constrainedSize:(CGRect)rect;

@end
