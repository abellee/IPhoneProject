//
//  LoginInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchableUILabel.h"
#import "InterfaceDelegate.h"

@interface LoginInterface : UIViewController<UITextFieldDelegate, TouchableUILabelDelegate>{
    UIButton* loginButton;
    UIButton* registButton;
    UIButton* othersLoginButton;
    UITextField* username;
    UITextField* password;
    TouchableUILabel* forgetPassword;
    
    id <InterfaceDelegate> delegate;
}

@property (nonatomic, retain) id<InterfaceDelegate> delegate;

@property (nonatomic, retain) UIButton* loginButton;
@property (nonatomic, retain) UIButton* registButton;
@property (nonatomic, retain) UIButton* othersLoginButton;
@property (nonatomic, retain) UITextField* username;
@property (nonatomic, retain) UITextField* password;
@property (nonatomic, retain) TouchableUILabel* forgetPassword;

- (void)initInterface;
- (void)resignTextField;
- (void)doLogin;

@end
