//
//  PetData.h
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Monster.h"

@interface PetData : Monster{
    int uid;
    int state;
    int life;
    int grow;
    int feel;
    int cur_exp;
    int total_exp;
    int age;
    NSMutableArray* equipList;
}

@property (nonatomic, assign, getter = uid, setter = uid:) int uid;
@property (nonatomic, assign, getter = state, setter = state:) int state;
@property (nonatomic, assign, getter = life, setter = life:) int life;
@property (nonatomic, assign, getter = grow, setter = grow:) int grow;
@property (nonatomic, assign, getter = feel, setter = feel:) int feel;
@property (nonatomic, assign, getter = cur_exp, setter = cur_exp:) int cur_exp;
@property (nonatomic, assign, getter = total_exp, setter = total_exp:) int total_exp;
@property (nonatomic, assign, getter = age, setter = age:) int age;
@property (nonatomic, retain, getter = equipList, setter = equipList:) NSMutableArray* equipList;

@end
