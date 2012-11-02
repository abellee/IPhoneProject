//
//  Character.m
//  YiZu
//
//  Created by Lee Abel on 12-10-31.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "Character.h"

@implementation Character

@synthesize nickname;
@synthesize avatar_img;
@synthesize signature;
@synthesize hobby;
@synthesize job;
@synthesize petList;
@synthesize resList;
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
@synthesize create_time;
@synthesize last_login;
@synthesize login_mode;
@synthesize state;
@synthesize home_latitude;
@synthesize home_longitude;
@synthesize cur_latitude;
@synthesize cur_longitude;

-(id)init
{
    if(self = [super init]){
        
    }
    return self;
}

-(NSMutableArray*)initPetListWithNSArray:(NSArray *)array
{
    [self petList:[NSMutableArray arrayWithArray:array]];
    return petList;
}

-(void)dealloc
{
    NSLog(@"********| Character dealloc! |********");
    [nickname release];
    [avatar_img release];
    [signature release];
    [hobby release];
    [job release];
    
    [petList removeAllObjects];
    [petList release];
    
    [super dealloc];
}

@end
