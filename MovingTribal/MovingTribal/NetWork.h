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
#import "Task.h"
#import "MTInfo.h"
#import "MTError.h"
#import "MTSucceed.h"
#import "EmotionAction.h"

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

typedef enum TaskResult{
	TargetIsSelf,          // 对方是自己 当邀请的对象的帐号最后一次登录是在当前此设备
	TargetRefuse,          // 对方拒绝
	TargetAccept           // 对方接受
}TaskResult;

@interface NetWork : NSObject

+ (void)logout:(UserData *)userData;
+ (int)login:(NSString *)username password:(NSString *)password;
+ (int)regist:(NSString *)nickname account:(NSString *)username password:(NSString *)password;
+ (int)sendText:(NSString *)text targetUser:(UserData *)userData;
+ (MTInfo *)inviteWithTask:(Task *)task userData:(UserData *)data;
+ (MTInfo *)sendActionEmotion:(EmotionAction *)emo userData:(UserData *)data;
+ (NSData *)locate;

@end
