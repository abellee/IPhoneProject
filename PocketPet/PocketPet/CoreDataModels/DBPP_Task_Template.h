//
//  DBPP_Task_Template.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_TaskAward;

@interface DBPP_Task_Template : NSManagedObject

@property (nonatomic, retain) NSString * task_name;
@property (nonatomic, retain) NSString * task_img;
@property (nonatomic, retain) NSString * task_des;
@property (nonatomic, retain) NSNumber * task_type;
@property (nonatomic, retain) NSNumber * req_level;
@property (nonatomic, retain) NSNumber * req_player_num;
@property (nonatomic, retain) NSNumber * item_id;
@property (nonatomic, retain) NSNumber * item_num;
@property (nonatomic, retain) NSNumber * npc_id;
@property (nonatomic, retain) NSNumber * monster_id;
@property (nonatomic, retain) NSNumber * monster_num;
@property (nonatomic, retain) NSNumber * res_id;
@property (nonatomic, retain) NSNumber * res_num;
@property (nonatomic, retain) NSNumber * duration;
@property (nonatomic, retain) NSNumber * action_id;
@property (nonatomic, retain) NSNumber * next_task_id;
@property (nonatomic, retain) NSNumber * invalid_time;
@property (nonatomic, retain) NSNumber * version;
@property (nonatomic, retain) NSSet *award;
@end

@interface DBPP_Task_Template (CoreDataGeneratedAccessors)

- (void)addAwardObject:(DBPP_TaskAward *)value;
- (void)removeAwardObject:(DBPP_TaskAward *)value;
- (void)addAward:(NSSet *)values;
- (void)removeAward:(NSSet *)values;

@end
