//
//  LoginInterfaceController.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentInterfaceController.h"
#import "TouchableUILabel.h"
#import "Config.h"
#import "DataCenter.h"

@interface LoginInterfaceController : ParentInterfaceController<UITextFieldDelegate, TouchableUILabelDelegate, TouchableUILabelDelegate>{
	UITextField *username;
	UITextField *password;
	UIImageView *logo;
	UISegmentedControl *modeControl;
	UIButton *registButton;
	UIButton *loginButton;
	
	TouchableUILabel *forgetPassword;
}

@end
