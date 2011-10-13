//
//  TaskMessageInfo.h
//  MovingTribal
//
//  Created by Lee Abel on 9/30/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MessageInfo.h"
#import "Task.h"

@interface TaskMessageInfo : MessageInfo{
	int taskId;
	Task* taskData;
}

@property (nonatomic, assign, getter = taskId, setter = taskId:) int taskId;
@property (nonatomic, assign, getter = taskData, setter = taskData:) Task* taskData;

@end
