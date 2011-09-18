//
//  LoginContainerDelegate.h
//  MovingTribal
//
//  Created by Lee Abel on 9/17/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginContainerDelegate <NSObject>

@optional
- (void)showLoginInterface;             // 登录界面
- (void)showRegistInterface;            // 注册界面
- (void)showOtherPlatformInterface;     // 其它平台界面
- (void)showForgetPasswordInterface;    // 找回密码界面
- (void)loginSuccess;                   // 登录成功
- (void)loginFailed;                    // 登录失败
- (void)registSuccess;                  // 注册成功
- (void)registFailed;                   // 注册失败
- (void)findPasswordSuccess;            // 找回密码成功
- (void)findPasswordFailed;             // 找回密码失败

- (void)exitRegistInterface;            // 退出注册界面
- (void)exitOtherPlatformInterface;     // 退出其它平台界面

@end
