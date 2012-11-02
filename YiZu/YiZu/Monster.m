//
//  Monster.m
//  YiZu
//
//  Created by Lee Abel on 12-10-31.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "Monster.h"

@implementation Monster

@synthesize tid;
@synthesize mid;
@synthesize res_id;
@synthesize hp;
@synthesize mp;
@synthesize max_hp;
@synthesize max_mp;
@synthesize level;
@synthesize nickname;
@synthesize isVariation;
@synthesize variation_level;
@synthesize skillList;

@synthesize power;
@synthesize agile;
@synthesize intellegence;
@synthesize vigour;
@synthesize endur;

@synthesize attack;
@synthesize defense;
@synthesize magic_damage;
@synthesize magic_defense;

-(id)init{
    if(self = [super init]){
        
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"*********| Monster dealloc! |***********");
    [super dealloc];
}

@end
