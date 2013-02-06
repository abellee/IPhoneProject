//
//  DBPP_Item_Template.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBPP_Item_Template : NSManagedObject

@property (nonatomic, retain) NSNumber * can_composition;
@property (nonatomic, retain) NSNumber * can_sell;
@property (nonatomic, retain) NSNumber * can_trade;
@property (nonatomic, retain) NSNumber * can_upgrade;
@property (nonatomic, retain) NSNumber * coin_price;
@property (nonatomic, retain) NSNumber * is_shop;
@property (nonatomic, retain) NSNumber * item_agile;
@property (nonatomic, retain) NSNumber * item_attack;
@property (nonatomic, retain) NSNumber * item_attack_level;
@property (nonatomic, retain) NSNumber * item_defense;
@property (nonatomic, retain) NSNumber * item_defense_level;
@property (nonatomic, retain) NSNumber * item_element;
@property (nonatomic, retain) NSNumber * item_endur;
@property (nonatomic, retain) NSNumber * item_exp;
@property (nonatomic, retain) NSNumber * item_feel;
@property (nonatomic, retain) NSNumber * item_hp;
@property (nonatomic, retain) NSNumber * item_intelligence;
@property (nonatomic, retain) NSNumber * item_invalid_time;
@property (nonatomic, retain) NSNumber * item_level;
@property (nonatomic, retain) NSNumber * item_life;
@property (nonatomic, retain) NSNumber * item_magic;
@property (nonatomic, retain) NSNumber * item_magic_defense;
@property (nonatomic, retain) NSNumber * item_magic_defense_level;
@property (nonatomic, retain) NSNumber * item_magic_level;
@property (nonatomic, retain) NSNumber * item_mp;
@property (nonatomic, retain) NSString * item_name;
@property (nonatomic, retain) NSNumber * item_power;
@property (nonatomic, retain) NSNumber * item_req_level;
@property (nonatomic, retain) NSNumber * item_type;
@property (nonatomic, retain) NSNumber * item_variation_rate;
@property (nonatomic, retain) NSNumber * item_vigour;
@property (nonatomic, retain) NSNumber * max_num;
@property (nonatomic, retain) NSNumber * parent_type;
@property (nonatomic, retain) NSNumber * token_price;
@property (nonatomic, retain) NSNumber * version;

@end
