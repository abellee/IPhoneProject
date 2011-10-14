//
//  Player.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize uid;
@synthesize weiboId;
@synthesize realName;
@synthesize nickname;
@synthesize avatarURL;
@synthesize blogURL;
@synthesize idNumber;
@synthesize msn;
@synthesize hobby;
@synthesize department;
@synthesize profession;
@synthesize profile;
@synthesize signature;
@synthesize account;
@synthesize password;
@synthesize longitude;
@synthesize latitude;
@synthesize did;
@synthesize phoneNumber;
@synthesize sex;
@synthesize age;
@synthesize school;
@synthesize birthdayYear;
@synthesize birthdayMonth;
@synthesize birthdayDate;
@synthesize qq;
@synthesize province;
@synthesize city;
@synthesize companyProvince;
@synthesize companyCity;
@synthesize constellation;
@synthesize symbol;
@synthesize bloodType;
@synthesize marriage;
@synthesize version;
@synthesize active;
@synthesize bound;

- (void)dealloc
{
    NSLog(@"******| Player |****** received dealloc message!");
    [weiboId release];
    [realName release];
	[nickname release];
	[avatarURL release];
	[blogURL release];
	[idNumber release];
	[msn release];
	[hobby release];
	[department release];
	[profession release];
	[profile release];
	[signature release];
	[account release];
	[did release];
	
	weiboId = nil;
	realName = nil;
	nickname = nil;
	avatarURL = nil;
	blogURL = nil;
	idNumber = nil;
	msn = nil;
	hobby = nil;
	department = nil;
	profession = nil;
	profile = nil;
	signature = nil;
	account = nil;
	did = nil;
	
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
