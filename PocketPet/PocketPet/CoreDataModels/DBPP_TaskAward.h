//
//  DBPP_TaskAward.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_Task_Template;

@interface DBPP_TaskAward : NSManagedObject

@property (nonatomic, retain) NSNumber * task_id;
@property (nonatomic, retain) NSNumber * parent_type;
@property (nonatomic, retain) NSNumber * item_type;
@property (nonatomic, retain) NSNumber * item_id;
@property (nonatomic, retain) NSNumber * item_num;
@property (nonatomic, retain) DBPP_Task_Template *task;

@end
