//
//  UserData.m
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "UserData.h"

@implementation UserData

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
@synthesize anno;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"******| UserData |****** receive dealloc message!");
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
	[anno release];
	
	anno = nil;
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

- (UserData *)parse:(GDataXMLElement *)item
{
	if(item){
		if([item elementsForName:@"account"]) account = [[[item elementsForName:@"account"] objectAtIndex:0] stringValue];
		if([item elementsForName:@"uid"]) uid = [[[[item elementsForName:@"uid"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"nickname"]) nickname = [[[item elementsForName:@"nickname"] objectAtIndex:0] stringValue];
		if([item elementsForName:@"sex"]) sex = [[[[item elementsForName:@"sex"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"avatarURL"]) avatarURL = [[[item elementsForName:@"avatarURL"] objectAtIndex:0] stringValue];
		if([item elementsForName:@"blogURL"]) blogURL = [[[item elementsForName:@"blogURL"] objectAtIndex:0] stringValue];
		if([item elementsForName:@"msn"]) msn = [[[item elementsForName:@"msn"] objectAtIndex:0] stringValue];
		if([item elementsForName:@"hobby"]) hobby = [[[item elementsForName:@"hobby"] objectAtIndex:0] stringValue];
		if([item elementsForName:@"department"]) department = [[[item elementsForName:@"department"] objectAtIndex:0] stringValue];
		if([item elementsForName:@"profession"]) profession = [[[item elementsForName:@"profession"] objectAtIndex:0] stringValue];
		if([item elementsForName:@"signature"]) signature = [[[item elementsForName:@"signature"] objectAtIndex:0] stringValue];
		if([item elementsForName:@"realName"]) realName = [[[item elementsForName:@"realName"] objectAtIndex:0] stringValue];
		if([item elementsForName:@"longitude"]) longitude = [[[[item elementsForName:@"longitude"] objectAtIndex:0] stringValue] doubleValue];
		if([item elementsForName:@"latitude"]) latitude = [[[[item elementsForName:@"latitude"] objectAtIndex:0] stringValue] doubleValue];
		if([item elementsForName:@"phoneNumber"]) phoneNumber = [[[[item elementsForName:@"phoneNumber"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"age"]) age = [[[[item elementsForName:@"age"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"school"]) school = [[[[item elementsForName:@"school"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"birthdayYear"]) birthdayYear = [[[[item elementsForName:@"birthdayYear"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"birthdayMonth"]) birthdayMonth = [[[[item elementsForName:@"birthdayMonth"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"birthdayDate"]) birthdayDate = [[[[item elementsForName:@"birthdayDate"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"qq"]) qq = [[[[item elementsForName:@"qq"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"province"]) province = [[[[item elementsForName:@"province"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"city"]) city = [[[[item elementsForName:@"city"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"companyProvince"]) companyProvince = [[[[item elementsForName:@"companyProvince"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"companyCity"]) companyCity = [[[[item elementsForName:@"companyCity"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"constellation"]) constellation = [[[[item elementsForName:@"constellation"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"symbol"]) symbol = [[[[item elementsForName:@"symbol"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"bloodType"]) bloodType = [[[[item elementsForName:@"bloodType"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"marriage"]) marriage = [[[[item elementsForName:@"marriage"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"version"]) version = [[[[item elementsForName:@"version"] objectAtIndex:0] stringValue] intValue];
		if([item elementsForName:@"bound"]) bound = [[[[item elementsForName:@"bound"] objectAtIndex:0] stringValue] intValue];
	}
	return self;
}

- (TestingAnnotation *)annotation
{
	return anno;
}

- (void)annotation:(TestingAnnotation *)ao
{
	if(anno != ao){
		[anno release];
		anno = [ao retain];
	}
}

- (int)uid
{
    return uid;
}

- (void)uid:(int)value
{
    if(value != uid) uid = value;
}

- (NSString *)weiboId
{
    return weiboId;
}

- (void)weiboId:(NSString *)str
{
    if(str != weiboId){
        [weiboId release];
        weiboId = [str retain];
    }
}

- (NSString *)realName
{
    return realName;
}

- (void)realName:(NSString *)str
{
    if(str != realName){
        [realName release];
        realName = [str retain];
    }
}

- (NSString *)nickname
{
	return nickname;
}

- (void)nickname:(NSString *)str
{
	if(nickname != str){
		[nickname release];
		nickname = [str retain];
	}
}

- (NSString *)avatarURL
{
	return avatarURL;
}

- (void)avatarURL:(NSString *)str
{
	if(avatarURL != str){
		[avatarURL release];
		avatarURL = [str retain];
	}
}

- (NSString *)blogURL
{
	return blogURL;
}

- (void)blogURL:(NSString *)str
{
	if(blogURL != str){
		[blogURL release];
		blogURL = [str retain];
	}
}

- (NSString *)idNumber
{
	return idNumber;
}

- (void)idNumber:(NSString *)str
{
	if(idNumber != str){
		[idNumber release];
		idNumber = [str retain];
	}
}

- (NSString *)msn
{
	return msn;
}

- (void)msn:(NSString *)str
{
	if(msn != str){
		[msn release];
		msn = [str retain];
	}
}

- (NSString *)hobby
{
	return hobby;
}

- (void)hobby:(NSString *)str
{
	if(hobby != str){
		[hobby release];
		hobby = [str retain];
	}
}

- (NSString *)department
{
	return department;
}

- (void)department:(NSString *)str
{
	if(department != str){
		[department release];
		department = [str retain];
	}
}

- (NSString *)profession
{
	return profession;
}

- (void)profession:(NSString *)str
{
	if(profession != str){
		[profession release];
		profession = [str retain];
	}
}

- (NSString *)profile
{
	return profile;
}

- (void)profile:(NSString *)str
{
	if(profile != str){
		[profile release];
		profile = [str retain];
	}
}

- (NSString *)signature
{
	return signature;
}

- (void)signature:(NSString *)str
{
	if(signature != str){
		[signature release];
		signature = [str retain];
	}
}

- (NSString *)account
{
	return account;
}

- (void)account:(NSString *)str
{
	if(account != str){
		[account release];
		account = [str retain];
	}
}

- (CGFloat)longitude
{
	return longitude;
}

- (void)longitude:(CGFloat)num
{
	if(longitude != num){
		longitude = num;
	}
}

- (CGFloat)latitude
{
	return latitude;
}

- (void)latitude:(CGFloat)num
{
	if(latitude != num){
		latitude = num;
	}
}

- (NSString *)did
{
	return did;
}

- (void)did:(NSString *)str
{
	if(did != str){
		[did release];
		did = str;
	}
}

- (int)phoneNumber
{
	return phoneNumber;
}

- (void)phoneNumber:(int)num
{
	if(phoneNumber != num){
		phoneNumber = num;
	}
}

- (int)sex
{
	return sex;
}

- (void)sex:(int)num
{
	if(sex != num){
		sex = num;
	}
}

- (int)age
{
	return age;
}

- (void)age:(int)num
{
	if(age != num){
		age = num;
	}
}

- (int)school
{
	return school;
}

- (void)school:(int)num
{
	if(school != num){
		school = num;
	}
}

- (int)birthdayYear
{
	return birthdayYear;
}

- (void)birthdayYear:(int)num
{
	if(birthdayYear != num){
		birthdayYear = num;
	}
}

- (int)birthdayMonth
{
	return birthdayMonth;
}

- (void)birthdayMonth:(int)num
{
	if(birthdayMonth != num){
		birthdayMonth = num;
	}
}

- (int)birthdayDate
{
	return birthdayDate;
}

- (void)birthdayDate:(int)num
{
	if(birthdayDate != num){
		birthdayDate = num;
	}
}

- (int)qq
{
	return qq;
}

- (void)qq:(int)num
{
	if(qq != num){
		qq = num;
	}
}

- (int)province
{
	return province;
}

- (void)province:(int)num
{
	if(province != num){
		province = num;
	}
}

- (int)city
{
	return city;
}

- (void)city:(int)num
{
	if(city != num){
		city = num;
	}
}

- (int)companyProvince
{
	return companyProvince;
}

- (void)companyProvince:(int)num
{
	if(companyProvince != num){
		companyProvince = num;
	}
}

- (int)companyCity
{
	return companyCity;
}

- (void)companyCity:(int)num
{
	if(companyCity != num){
		companyCity = num;
	}
}

- (int)constellation
{
	return constellation;
}

- (void)constellation:(int)num
{
	if(constellation != num){
		constellation = num;
	}
}

- (int)symbol
{
	return symbol;
}

- (void)symbol:(int)num
{
	if(symbol != num){
		symbol = num;
	}
}

- (int)bloodType
{
	return bloodType;
}

- (void)bloodType:(int)num
{
	if(bloodType != num){
		bloodType = num;
	}
}

- (int)marriage
{
	return marriage;
}

- (void)marriage:(int)num
{
	if(marriage != num){
		marriage = num;
	}
}

- (int)version
{
	return version;
}

- (void)version:(int)vs
{
	if(version != vs){
		version = vs;
	}
}

- (int)active
{
	return active;
}

- (void)active:(int)a
{
	if(active != a){
		active = a;
	}
}

- (int)bound
{
	return bound;
}

- (void)bound:(int)num
{
	if(bound != num){
		bound = num;
	}
}

@end
