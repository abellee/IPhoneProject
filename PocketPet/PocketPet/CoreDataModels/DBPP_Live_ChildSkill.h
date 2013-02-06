//
//  DBPP_Live_ChildSkill.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-17.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_Live_ChildSkillData, DBPP_Live_Skill;

@interface DBPP_Live_ChildSkill : NSManagedObject

@property (nonatomic, retain) NSNumber * req_formula;
@property (nonatomic, retain) NSNumber * req_level;
@property (nonatomic, retain) NSNumber * req_practise;
@property (nonatomic, retain) NSString * skill_des;
@property (nonatomic, retain) NSString * skill_icon;
@property (nonatomic, retain) NSString * skill_name;
@property (nonatomic, retain) NSNumber * target_item_id;
@property (nonatomic, retain) NSNumber * live_skill_id;
@property (nonatomic, retain) NSNumber * skill_id;
@property (nonatomic, retain) DBPP_Live_Skill *live_skill;
@property (nonatomic, retain) NSSet *skill_data;
@end

@interface DBPP_Live_ChildSkill (CoreDataGeneratedAccessors)

- (void)addSkill_dataObject:(DBPP_Live_ChildSkillData *)value;
- (void)removeSkill_dataObject:(DBPP_Live_ChildSkillData *)value;
- (void)addSkill_data:(NSSet *)values;
- (void)removeSkill_data:(NSSet *)values;

@end
