//
//  NetWork.m
//  MovingTribal
//
//  Created by Lee Abel on 9/25/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "NetWork.h"
#import "RegexKitLite.h"

@implementation NetWork

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (void)locate
{
	NSLog(@"%d>>>>>%f>>>>>%f", [[Globals getUserData] uid], [[Globals getUserData] longtitude], [[Globals getUserData] latitude]);
	NSString* urlString = [NSString stringWithFormat:@"/query.php?action=locate&uid=%d&longitude=%f&latitude=%f", [[Globals getUserData] uid], [[Globals getUserData] longtitude], [[Globals getUserData] latitude]];
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString* str = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	NSLog(@"%@", str);
}

+ (void)logout:(UserData *)userData
{
	NSString* urlString = [NSString stringWithFormat:@"/logout.php?id=%d", userData.uid];
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString* str = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	NSLog(@"%@", str);
    [url release];
    [request release];
	[str release];
}

+ (int)login:(NSString *)username password:(NSString *)password
{
	if(![username isMatchedByRegex:@"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"]){
		return AccountPatternError;              // 帐号必需为邮箱地址
	}
	NSUInteger passwordLen = [password length];
	if(passwordLen < 6 || passwordLen > 20){
		return PasswordLenError;
	}
	UIDevice *dev = [UIDevice currentDevice];
	NSString *deviceUuid;
	if ([dev respondsToSelector:@selector(uniqueIdentifier)])
		deviceUuid = dev.uniqueIdentifier;
	else {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		id uuid = [defaults objectForKey:@"deviceUuid"];
		if (uuid)
			deviceUuid = (NSString *)uuid;
		else {
			CFStringRef cfUuid = CFUUIDCreateString(NULL, CFUUIDCreate(NULL));
			deviceUuid = (NSString *)cfUuid;
			CFRelease(cfUuid);
			[defaults setObject:deviceUuid forKey:@"deviceUuid"];
		}
	}
	username = [username lowercaseString];
	password = [password lowercaseString];
	NSString* urlString = [NSString stringWithFormat:@"/login.php?account=%@&password=%@&deviceuid=%@", username, [Globals md5:password], deviceUuid];
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString* str = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	int result = 0;
	NSLog(@"%d", [str intValue]);
	if([str length] > 1){
		result = 1;
	}
    [url release];
    [request release];
	[str release];
	if(result == 0){
		return LoginFailed;
	}else{
		UserData* userData = [[UserData alloc] parse:returnData];
		[Globals setUserData:userData];
		[userData release];
		return LoginSuccess;
	}
}

+ (int)regist:(NSString *)nickname account:(NSString *)username password:(NSString *)password
{
	NSUInteger nicknameLen = [nickname length];
	if(nicknameLen < 4 || nicknameLen > 12){
		return NicknameLenError;                 // 昵称长度错误
	}
	if(![nickname isMatchedByRegex:[NSString stringWithFormat:@"[a-zA-Z\\d\\u4e00-\\u9fa5_\\-]{%d}?", [nickname length]]]){
		return NicknamePatternError;                 // 昵称只支持中英文，数字 "_"或减号
	}
	if(![username isMatchedByRegex:@"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"]){
		return AccountPatternError;              // 帐号必需为邮箱地址
	}
	NSUInteger passwordLen = [password length];
	if(passwordLen < 6 || passwordLen > 20){
		return PasswordLenError;                 // 密码长度必需6-20
	}
	UIDevice *dev = [UIDevice currentDevice];
	NSString *deviceUuid;
	if ([dev respondsToSelector:@selector(uniqueIdentifier)])
		deviceUuid = dev.uniqueIdentifier;
	else {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		id uuid = [defaults objectForKey:@"deviceUuid"];
		if (uuid)
			deviceUuid = (NSString *)uuid;
		else {
			CFStringRef cfUuid = CFUUIDCreateString(NULL, CFUUIDCreate(NULL));
			deviceUuid = (NSString *)cfUuid;
			CFRelease(cfUuid);
			[defaults setObject:deviceUuid forKey:@"deviceUuid"];
		}
	}
	username = [username lowercaseString];
	password = [password lowercaseString];
	
	NSString* urlString = [NSString stringWithFormat:@"/regist.php?nickname=%@&account=%@&password=%@&deviceuid=%@", nickname, username, [Globals md5:password], deviceUuid];
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString* str = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	int result = [str intValue];
    [url release];
    [request release];
	[str release];
	switch (result) {
		case 1:
			return RegistSuccess;
			break;
		case 0:
			return RegistFailed;
			break;
		case 2:
			return AccountExsit;
			break;
		default:
			break;
	}
	return ServerError;
}

+ (int)sendText:(NSString *)text targetUser:(UserData *)userData
{
	NSString* urlString = [NSString stringWithFormat:@"/easyAPNS/push.php?text=%@&uid=%d", text, userData.uid];
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString* str = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    [url release];
    [request release];
	if(str == @"YES"){
		[str release];
		return SendSuccess;
	}else{
		[str release];
		return SendFailed;
	}
}

@end
