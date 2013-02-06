//
//  DBPP_Pet_Template.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBPP_Pet_Template : NSManagedObject

@property (nonatomic, retain) NSString * pet_name;
@property (nonatomic, retain) NSNumber * pet_element;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSNumber * hp;
@property (nonatomic, retain) NSNumber * mp;
@property (nonatomic, retain) NSNumber * life;
@property (nonatomic, retain) NSNumber * grow;
@property (nonatomic, retain) NSNumber * feel;
@property (nonatomic, retain) NSNumber * variation_level;
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
@property (nonatomic, retain) NSNumber * version;
@property (nonatomic, retain) NSNumber * map_id;
@property (nonatomic, retain) NSNumber * is_boss;
@property (nonatomic, retain) NSNumber * is_npc;

@end
