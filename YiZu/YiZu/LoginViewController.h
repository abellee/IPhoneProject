//
//  LoginLayerControllerViewController.h
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"
#import "SystemConfig.h"
#import "Global.h"
#import "RegistLayer.h"
#import "LoginDelegate.h"

@interface LoginViewController : UIViewController <UIWebViewDelegate, LoginDelegate, UITextFieldDelegate>{
    UITextField *username;
    UITextField *password;
    UILabel *findPassword;
    UIButton *loginButton;
    UIButton *registButton;
    UINavigationController *navigationController;
    
    NSArray *platformList;
    
    UIButton *sinaWeibo;
    UIButton *qqWeibo;
    UIButton *neteaseWeibo;
    UIButton *renren;
    
    NSString *access_token;
    
    RegistLayer* registLayer;
}

@property (nonatomic, retain) UITextField   *username;
@property (nonatomic, retain) UITextField   *password;
@property (nonatomic, retain) UILabel       *findPassword;
@property (nonatomic, retain) UIButton      *loginButton;
@property (nonatomic, retain) UIButton      *registButton;

@property (nonatomic, retain) UIButton      *sinaWeibo;
@property (nonatomic, retain) UIButton      *qqWeibo;
@property (nonatomic, retain) UIButton      *neteaseWeibo;
@property (nonatomic, retain) UIButton      *renren;

@property (nonatomic, retain) NSString      *access_token;
@property (nonatomic, retain) NSArray       *platformList;

@property (nonatomic, retain) RegistLayer   *registLayer;

@end
