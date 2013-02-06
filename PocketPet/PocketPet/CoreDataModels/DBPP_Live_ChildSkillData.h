//
//  DBPP_Live_ChildSkillData.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-17.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_Live_ChildSkill;

@interface DBPP_Live_ChildSkillData : NSManagedObject

@property (nonatomic, retain) NSNumber * item_id;
@property (nonatomic, retain) NSNumber * item_num;
@property (nonatomic, retain) NSNumber * skill_id;
@property (nonatomic, retain) NSNumber * data_id;
@property (nonatomic, retain) DBPP_Live_ChildSkill *child_skill;

@end
