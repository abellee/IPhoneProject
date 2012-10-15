//
//  RegistLayer.h
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginDelegate.h"
#import "SystemConfig.h"
#import "EditableUITableViewController.h"

@interface RegistLayer : UIViewController{
    UITextField *nickname;
    UITextField *password;
    UITextField *repassword;
    
    /**
     * 用户邮箱地址，亦为登录帐号
     */
    UITextField *email;
    
    UIButton* head;
    UIButton* takePhoto;
    UIButton* album;
    
    EditableUITableViewController* registForm;
    
    id<LoginDelegate> delegate;
}

@property (nonatomic, retain) UITextField *nickname;
@property (nonatomic, retain) UITextField *password;
@property (nonatomic, retain) UITextField *repassword;
@property (nonatomic, retain) UITextField *email;
@property (nonatomic, retain) UIButton* head;
@property (nonatomic, retain) UIButton* takePhoto;
@property (nonatomic, retain) UIButton* album;
@property (nonatomic, retain) EditableUITableViewController* registForm;

@property (nonatomic, assign) id<LoginDelegate> delegate;

@end
