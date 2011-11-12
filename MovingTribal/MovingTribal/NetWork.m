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

+ (NSData *)locate
{
	NSLog(@"%d>>>>%f>>>>%f", [[Globals getUserData] uid], [[Globals getUserData] longitude], [[Globals getUserData] latitude]);
	NSString* urlString = [NSString stringWithFormat:@"/query.php?action=locate&uid=%d&longitude=%f&latitude=%f", [[Globals getUserData] uid], [[Globals getUserData] longitude], [[Globals getUserData] latitude]];
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	[url release];
	[request release];
	return returnData;
}

+ (MTInfo *)inviteWithTask:(Task *)task userData:(UserData *)data
{
	NSLog(@"%d>>>>>%d>>>>>%d", [[Globals getUserData] uid], data.uid, task.authorId);
	NSString* urlString = [NSString stringWithFormat:@"/query.php?action=task&tid=%d&from=%d&to=%d&aid=%d", task.taskId, [[Globals getUserData] uid], data.uid, task.authorId];
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	[url release];
	[request release];
	NSLog(@"invite task return!");
	NSLog(@"%@", [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding]);
	GDataXMLDocument* doc = [[GDataXMLDocument alloc] initWithData:returnData options:0 error:nil];
	if(doc){
		NSArray* arr = [doc.rootElement elementsForName:@"result"];
		GDataXMLElement* item = [arr objectAtIndex:0];
		int type = [[[[item elementsForName:@"type"] objectAtIndex:0] stringValue] intValue];
		int code = [[[[item elementsForName:@"code"] objectAtIndex:0] stringValue] intValue];
		NSString* info = [[[item elementsForName:@"info"] objectAtIndex:0] stringValue];
		[doc release];
		if(type == 0){               // 错误返回
			MTError* error = [[MTError alloc] init];
			error.errorCode = code;
			error.infoString = info;
			return error;
		}else if(type == 1){         // 成功返回
			MTSucceed* succeed = [[MTSucceed alloc] init];
			succeed.infoString = info;
			return succeed;
		}
	}
	return nil;
}

+ (MTInfo *)sendActionEmotion:(EmotionAction *)emo userData:(UserData *)data
{
	NSString* urlString = [NSString stringWithFormat:@"/query.php?action=emotion&eid=%d&from=%d&to=%d", emo.emotionId, [[Globals getUserData] uid], data.uid];
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	[url release];
	[request release];
	GDataXMLDocument* doc = [[GDataXMLDocument alloc] initWithData:returnData options:0 error:nil];
	if(doc){
		NSArray* arr = [doc.rootElement elementsForName:@"result"];
		GDataXMLElement* item = [arr objectAtIndex:0];
		int type = [[[[item elementsForName:@"type"] objectAtIndex:0] stringValue] intValue];
		int code = [[[[item elementsForName:@"code"] objectAtIndex:0] stringValue] intValue];
		NSString* info = [[[item elementsForName:@"info"] objectAtIndex:0] stringValue];
		[doc release];
		if(type == 0){               // 错误返回
			MTError* error = [[MTError alloc] init];
			error.errorCode = code;
			error.infoString = info;
			return error;
		}else if(type == 1){         // 成功返回
			MTSucceed* succeed = [[MTSucceed alloc] init];
			succeed.infoString = info;
			return succeed;
		}
	}
	return nil;
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
	NSLog(@"%d", [str length]);
	if([str length] > 1){
		result = 1;
	}
    [url release];
    [request release];
	[str release];
	if(result == 0){
		return LoginFailed;
	}else{
		GDataXMLDocument* doc = [[GDataXMLDocument alloc] initWithData:returnData options:0 error:nil];
		NSArray* arr = [doc.rootElement elementsForName:@"user"];
		GDataXMLElement* item = [arr objectAtIndex:0];
		NSLog(@"%d", [[[[item elementsForName:@"uid"] objectAtIndex:0] stringValue] intValue]);
		UserData* userData = [[UserData alloc] parse:item];
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
	
	NSString* urlString = [NSString stringWithFormat:@"/regist.php?realName=%@&account=%@&password=%@&deviceuid=%@", nickname, username, [Globals md5:password], deviceUuid];
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
		case 2:
			return RegistFailed;
			break;
		case 0:
			return AccountExsit;
			break;
		default:
			break;
	}
	return ServerError;
}

+ (MTInfo *)sendText:(NSString *)text targetUser:(UserData *)userData
{
	NSString* urlString = [NSString stringWithFormat:@"/query.php?action=chat&text=%@&from=%d&to=%d", text, [Globals getUserData].uid, userData.uid];
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    [url release];
    [request release];
	GDataXMLDocument* doc = [[GDataXMLDocument alloc] initWithData:returnData options:0 error:nil];
	if(doc){
		NSArray* arr = [doc.rootElement elementsForName:@"result"];
		GDataXMLElement* item = [arr objectAtIndex:0];
		int type = [[[[item elementsForName:@"type"] objectAtIndex:0] stringValue] intValue];
		int code = [[[[item elementsForName:@"code"] objectAtIndex:0] stringValue] intValue];
		NSString* info = [[[item elementsForName:@"info"] objectAtIndex:0] stringValue];
		[doc release];
		if(type == 0){               // 错误返回
			MTError* error = [[MTError alloc] init];
			error.errorCode = code;
			error.infoString = info;
			return error;
		}else if(type == 1){         // 成功返回
			MTSucceed* succeed = [[MTSucceed alloc] init];
			succeed.infoString = info;
			return succeed;
		}
	}
	return nil;
}

@end
