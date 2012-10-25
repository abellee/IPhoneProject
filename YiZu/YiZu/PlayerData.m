//
//  PlayerData.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "PlayerData.h"

@implementation PlayerData

@synthesize nickname;
@synthesize avatar_img;
@synthesize signature;
@synthesize hobby;
@synthesize job;
@synthesize telephone;
@synthesize petList;
@synthesize allTasks;
@synthesize doneTask;
@synthesize doingTask;
@synthesize uid;
@synthesize sex;
@synthesize constellation;
@synthesize birthday;
@synthesize blood_type;
@synthesize nation;
@synthesize province;
@synthesize city;
@synthesize coin;
@synthesize token;
@synthesize level;
@synthesize country;
@synthesize resource_num;
@synthesize pet_num;
@synthesize bag_num;
@synthesize create_time;
@synthesize last_login;
@synthesize login_mode;
@synthesize state;
@synthesize bid;
@synthesize home_latitude;
@synthesize home_longitude;
@synthesize cur_latitude;
@synthesize cur_longitude;

- (id)init
{
    if(self = [super init]){
        
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"*************| PlayerData dealloc! |************");
    [nickname release];
    [avatar_img release];
    [signature release];
    [hobby release];
    [job release];
    [telephone release];
    
    [petList removeAllObjects];
    [allTasks removeAllObjects];
    [doneTask removeAllObjects];
    [doingTask removeAllObjects];
    [petList release];
    [allTasks release];
    [doneTask release];
    [doingTask release];
    
    [super dealloc];
}

@end
