//
//  NetWork.h
//  MovingTribal
//
//  Created by Lee Abel on 9/25/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"
#import "Globals.h"

typedef enum LoginResult{
	LoginSuccess,
	AccountPatternError,
	LoginFailed,
	PasswordLenError,
	
	NicknamePatternError,
	NicknameLenError,
	AccountExsit,
	RegistSuccess,
	RegistFailed,
	
	ServerError
}LoginResult;

typedef enum ChatResult{
	SendSuccess,
	SendFailed
}ChatResult;

@interface NetWork : NSObject

+ (void)logout:(UserData *)userData;
+ (int)login:(NSString *)username password:(NSString *)password;
+ (int)regist:(NSString *)nickname account:(NSString *)username password:(NSString *)password;
+ (int)sendText:(NSString *)text targetUser:(UserData *)userData;
+ (void)locate;

@end
