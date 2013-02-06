//
//  Character.h
//  YiZu
//
//  Created by Lee Abel on 12-10-31.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject{
    NSString* nickname;
    NSString* avatar_img;
    NSString* signature;
    NSString* hobby;
    NSString* job;
    NSMutableArray* petList;
    NSMutableArray* resList;
    
    int uid;
    int sex;
    int age;
    int constellation;
    int birthday;
    int blood_type;
    int nation;
    int province;
    int city;
    int coin;
    int token;
    int level;
    int country;
    int resource_num;
    int pet_num;
    
    int create_time;
    int last_login;
    int login_mode;
    int state;
    
    double home_latitude;
    double home_longitude;
    double cur_latitude;
    double cur_longitude;
}

@property (nonatomic, retain, getter = nickname, setter = nickname:) NSString* nickname;
@property (nonatomic, retain, getter = avatar_img, setter = avatar_img:) NSString* avatar_img;
@property (nonatomic, retain, getter = signature, setter = signature:) NSString* signature;
@property (nonatomic, retain, getter = hobby, setter = hobby:) NSString* hobby;
@property (nonatomic, retain, getter = job, setter = job:) NSString* job;

@property (nonatomic, retain, setter = petList:) NSMutableArray* petList;
@property (nonatomic, retain, setter = resList:) NSMutableArray* resList;

@property (nonatomic, assign, getter = uid, setter = uid:) int uid;
@property (nonatomic, assign, getter = sex, setter = sex:) int sex;
@property (nonatomic, assign, getter = age, setter = age:) int age;
@property (nonatomic, assign, getter = constellation, setter = constellation:) int constellation;
@property (nonatomic, assign, getter = birthday, setter = birthday:) int birthday;
@property (nonatomic, assign, getter = blood_type, setter = blood_type:) int blood_type;
@property (nonatomic, assign, getter = nation, setter = nation:) int nation;
@property (nonatomic, assign, getter = province, setter = province:) int province;
@property (nonatomic, assign, getter = city, setter = city:) int city;
@property (nonatomic, assign, getter = coin, setter = coin:) int coin;
@property (nonatomic, assign, getter = token, setter = token:) int token;
@property (nonatomic, assign, getter = level, setter = level:) int level;
@property (nonatomic, assign, getter = country, setter = country:) int country;
@property (nonatomic, assign, getter = resource_num, setter = resource_num:) int resource_num;
@property (nonatomic, assign, getter = pet_num, setter = pet_num:) int pet_num;

@property (nonatomic, assign, getter = create_time, setter = create_time:) int create_time;
@property (nonatomic, assign, getter = last_login, setter = last_login:) int last_login;
@property (nonatomic, assign, getter = login_mode, setter = login_mode:) int login_mode;
@property (nonatomic, assign, getter = state, setter = state:) int state;

@property (nonatomic, assign, getter = home_latitude, setter = home_latitude:) double home_latitude;
@property (nonatomic, assign, getter = home_longitude, setter = home_longitude:) double home_longitude;
@property (nonatomic, assign, getter = cur_latitude, setter = cur_latitude:) double cur_latitude;
@property (nonatomic, assign, getter = cur_longitude, setter = cur_longitude:) double cur_longitude;

-(NSMutableArray*)initPetListWithNSArray:(NSArray*)array;

@end
