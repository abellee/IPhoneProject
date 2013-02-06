//
//  Monster.h
//  YiZu
//
//  Created by Lee Abel on 12-10-31.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Organisms.h"

@interface Monster : Organisms{
    int tid;
    int mid;
    int res_id;
    int hp;
    int mp;
    int max_hp;
    int max_mp;
    int level;
    NSString* nickname;
    BOOL isVariation;
    int variation_level;
    NSMutableArray* skillList;
    
    int power;
    int agile;
    int intellegence;
    int vigour;
    int endur;
    
    int attack;
    int defense;
    int magic_damage;
    int magic_defense;
}

@property (nonatomic, assign, getter = tid, setter = tid:) int tid;
@property (nonatomic, assign, getter = mid, setter = mid:) int mid;
@property (nonatomic, assign, getter = res_id, setter = res_id:) int res_id;
@property (nonatomic, assign, getter = hp, setter = hp:) int hp;
@property (nonatomic, assign, getter = mp, setter = mp:) int mp;
@property (nonatomic, assign, getter = max_hp, setter = max_hp:) int max_hp;
@property (nonatomic, assign, getter = max_mp, setter = max_mp:) int max_mp;
@property (nonatomic, assign, getter = level, setter = level:) int level;
@property (nonatomic, retain, getter = nickname, setter = nickname:) NSString* nickname;
@property (nonatomic, assign, getter = isVariation, setter = isVariation:) BOOL isVariation;
@property (nonatomic, assign, getter = variation_level, setter = variation_level:) int variation_level;
@property (nonatomic, retain, getter = skillList, setter = skillList:) NSMutableArray* skillList;
@property (nonatomic, assign, getter = power, setter = power:) int power;
@property (nonatomic, assign, getter = agile, setter = agile:) int agile;
@property (nonatomic, assign, getter = intellegence, setter = intellegence:) int intellegence;
@property (nonatomic, assign, getter = vigour, setter = vigour:) int vigour;
@property (nonatomic, assign, getter = endur, setter = endur:) int endur;
@property (nonatomic, assign, getter = attack, setter = attack:) int attack;
@property (nonatomic, assign, getter = defense, setter = defense:) int defense;
@property (nonatomic, assign, getter = magic_damage, setter = magic_damage:) int magic_damage;
@property (nonatomic, assign, getter = magic_defense, setter = magic_defense:) int magic_defense;

@end
