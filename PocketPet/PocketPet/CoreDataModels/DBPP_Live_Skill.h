//
//  DBPP_Live_Skill.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-17.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_Live_ChildSkill;

@interface DBPP_Live_Skill : NSManagedObject

@property (nonatomic, retain) NSNumber * req_element;
@property (nonatomic, retain) NSNumber * req_level;
@property (nonatomic, retain) NSNumber * req_sex;
@property (nonatomic, retain) NSNumber * req_task;
@property (nonatomic, retain) NSString * skill_name;
@property (nonatomic, retain) NSNumber * skill_id;
@property (nonatomic, retain) NSSet *child_skill;
@end

@interface DBPP_Live_Skill (CoreDataGeneratedAccessors)

- (void)addChild_skillObject:(DBPP_Live_ChildSkill *)value;
- (void)removeChild_skillObject:(DBPP_Live_ChildSkill *)value;
- (void)addChild_skill:(NSSet *)values;
- (void)removeChild_skill:(NSSet *)values;

@end
