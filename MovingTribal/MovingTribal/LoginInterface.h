//
//  LoginInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "TouchableUILabel.h"
#import "SoundRecorder.h"
#import "EmotionsView.h"

#import "LoginContainerDelegate.h"

@interface LoginInterface : UIViewController<UITextFieldDelegate, TouchableUILabelDelegate>{
    UIButton* loginButton;
    UIButton* registButton;
    UIButton* othersLoginButton;
    UITextField* username;
    UITextField* password;
    TouchableUILabel* forgetPassword;
    
    id <LoginContainerDelegate> delegate;
    
    SoundRecorder* soundRecorder;
	EmotionsView* emotionsView;
}

@property (nonatomic, assign) id<LoginContainerDelegate> delegate;

@property (nonatomic, retain) UIButton* loginButton;
@property (nonatomic, retain) UIButton* registButton;
@property (nonatomic, retain) UIButton* othersLoginButton;
@property (nonatomic, retain) UITextField* username;
@property (nonatomic, retain) UITextField* password;
@property (nonatomic, retain) TouchableUILabel* forgetPassword;
@property (nonatomic, assign) SoundRecorder* soundRecorder;
@property (nonatomic, assign) EmotionsView* emotionsView;

- (void)initInterface;
- (void)resignTextField;
- (void)doLogin;

@end
