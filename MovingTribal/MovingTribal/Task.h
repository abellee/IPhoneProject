//
//  Task.h
//  MovingTribal
//
//  Created by Lee Abel on 9/27/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum TaskType{
	kTaskPlayerToPlayer,
	kTaskPlayerToSeller,
	kTaskPlayerToMovingTribal,
	kTaskSellerToPlayer,
	kTaskMovingTibalToPlayer
}TaskType;

typedef enum SexRequirement{
	Same,
	Diff,
	All
}SexRequirement;

@interface Task : NSObject{
	NSString* taskDescription;             // 任务介绍
	NSString* taskAward;                   // 任务奖励
	NSString* taskName;                    // 任务名称
	NSString* taskPublisher;               // 任务发布者
	
	NSDictionary* taskRequirement;         // 任务要求
										   // 形式: {sex:Same, age:24, personNum:3}
	                                       // 说明: 需要与3位同性别的玩家，年龄要求24岁完成该任务
	
	int taskType;                          // 任务类型 typedef enum TaskType { ... } TaskType;
	int taskPublishTime;                   // 任务发布时间
	int taskExpireTime;                    // 任务结束时间
	
	BOOL isExpired;                        // 是否已过期
	BOOL completion;                       // 是否已完成 0:未完成 1:已完成
}

@property (nonatomic, assign, getter = taskDescription, setter = taskDescription:) NSString* taskDescription;
@property (nonatomic, assign, getter = taskAward, setter = taskAward:) NSString* taskAward;
@property (nonatomic, assign, getter = taskName, setter = taskName:) NSString* taskName;
@property (nonatomic, assign, getter = taskPublisher, setter = taskPublisher:) NSString* taskPublisher;
@property (nonatomic, assign, getter = taskRequirement, setter = taskRequirement:) NSDictionary* taskRequirement;
@property (nonatomic, assign, getter = taskType, setter = taskType:) int taskType;
@property (nonatomic, assign, getter = taskPublishTime, setter = taskPublishTime:) int taskPublishTime;
@property (nonatomic, assign, getter = taskExpireTime, setter = taskExpireTime:) int taskExpireTime;
@property (nonatomic, assign, getter = isExpired, setter = isExpired:) BOOL isExpired;
@property (nonatomic, assign, getter = completion, setter = completion:) BOOL completion;

@end
