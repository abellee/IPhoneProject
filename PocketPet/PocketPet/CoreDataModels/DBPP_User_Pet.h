//
//  DBPP_User_Pet.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_Equipment, DBPP_PetSkill, DBPP_UserData_Version;

@interface DBPP_User_Pet : NSManagedObject

@property (nonatomic, retain) NSNumber * uid;
@property (nonatomic, retain) NSNumber * pet_id;
@property (nonatomic, retain) NSString * pet_name;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSNumber * cur_exp;
@property (nonatomic, retain) NSNumber * total_exp;
@property (nonatomic, retain) NSNumber * cur_hp;
@property (nonatomic, retain) NSNumber * total_hp;
@property (nonatomic, retain) NSNumber * cur_mp;
@property (nonatomic, retain) NSNumber * total_mp;
@property (nonatomic, retain) NSNumber * state;
@property (nonatomic, retain) NSNumber * life;
@property (nonatomic, retain) NSNumber * grow;
@property (nonatomic, retain) NSNumber * feel;
@property (nonatomic, retain) NSNumber * veriation_level;
@property (nonatomic, retain) NSNumber * isVariation;
@property (nonatomic, retain) NSNumber * power;
@property (nonatomic, retain) NSNumber * agile;
@property (nonatomic, retain) NSNumber * intelligence;
@property (nonatomic, retain) NSNumber * vigour;
@property (nonatomic, retain) NSNumber * endur;
@property (nonatomic, retain) NSNumber * attack;
@property (nonatomic, retain) NSNumber * defense;
@property (nonatomic, retain) NSNumber * magic_damage;
@property (nonatomic, retain) NSNumber * magic_defense;
@property (nonatomic, retain) NSNumber * attack_level;
@property (nonatomic, retain) NSNumber * defense_level;
@property (nonatomic, retain) NSNumber * magic_level;
@property (nonatomic, retain) NSNumber * magic_defense_level;
@property (nonatomic, retain) NSNumber * last_equip_version_id;
@property (nonatomic, retain) NSNumber * last_skill_version_id;
@property (nonatomic, retain) NSNumber * version_id;
@property (nonatomic, retain) NSSet *equipment;
@property (nonatomic, retain) NSSet *skill;
@property (nonatomic, retain) DBPP_UserData_Version *user_data;
@end

@interface DBPP_User_Pet (CoreDataGeneratedAccessors)

- (void)addEquipmentObject:(DBPP_Equipment *)value;
- (void)removeEquipmentObject:(DBPP_Equipment *)value;
- (void)addEquipment:(NSSet *)values;
- (void)removeEquipment:(NSSet *)values;

- (void)addSkillObject:(DBPP_PetSkill *)value;
- (void)removeSkillObject:(DBPP_PetSkill *)value;
- (void)addSkill:(NSSet *)values;
- (void)removeSkill:(NSSet *)values;

@end
