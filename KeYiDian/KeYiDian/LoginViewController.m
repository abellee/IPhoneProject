//
//  LoginViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "LoginViewController.h"
#import "Utility.h"
#import "UIImage+Extensions.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        title = @"会员登录";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImage* registSkinNormal = [UIImage getImageWithFileName:@"zhuce0"];
    UIImage* registSkinHighlighted = [UIImage getImageWithFileName:@"zhuce1"];
    registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registButton setBackgroundImage:registSkinNormal forState:UIControlStateNormal];
    [registButton setBackgroundImage:registSkinHighlighted forState:UIControlStateHighlighted];
    [registButton setFrame:CGRectMake(0, 0, registSkinNormal.size.width, registSkinNormal.size.height)];
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:registButton];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    [barButtonItem release];
    
    NSString* usernameStr = @"用户名:";
    CGSize usernameStrSize = [Utility getCGSizeWithFontSize:15.0 str:usernameStr isBold:NO];
    usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, usernameStrSize.width, usernameStrSize.height)];
    [usernameLabel setText:usernameStr];
    [usernameLabel setTextColor:[UIColor darkGrayColor]];
    [usernameLabel setBackgroundColor:[UIColor clearColor]];
    [usernameLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
    
    usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 20, self.view.frame.size.width - 20, 40)];
    [usernameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    usernameTextField.leftView = usernameLabel;
    usernameTextField.leftViewMode = UITextFieldViewModeAlways;
    usernameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    usernameTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:usernameTextField];
    
    NSString* passwordStr = @"密    码:";
    CGSize passwordStrSize = [Utility getCGSizeWithFontSize:15.0 str:passwordStr isBold:NO];
    passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, passwordStrSize.width, passwordStrSize.height)];
    [passwordLabel setText:passwordStr];
    [passwordLabel setTextColor:[UIColor darkGrayColor]];
    [passwordLabel setBackgroundColor:[UIColor clearColor]];
    [passwordLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
    
    passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, self.view.frame.size.width - 20, 40)];
    [passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    passwordTextField.leftView = passwordLabel;
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:passwordTextField];
    
    UIImage* loginButtonSkinNormal = [UIImage getImageWithFileName:@"denglu1"];
    UIImage* loginButtonSkinHighlighted = [UIImage getImageWithFileName:@"denglu0"];
    loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setBackgroundImage:loginButtonSkinNormal forState:UIControlStateNormal];
    [loginButton setBackgroundImage:loginButtonSkinHighlighted forState:UIControlStateHighlighted];
    [loginButton setFrame:CGRectMake(10, passwordTextField.frame.origin.y + passwordTextField.frame.size.height + 10, loginButtonSkinNormal.size.width, loginButtonSkinNormal.size.height)];
    [self.view addSubview:loginButton];
    
    UIImage* sinaNormal = [UIImage getImageWithFileName:@"xinglang0"];
    UIImage* sinaHighlighted = [UIImage getImageWithFileName:@"xinglang1"];
    sinaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sinaButton setBackgroundImage:sinaNormal forState:UIControlStateNormal];
    [sinaButton setBackgroundImage:sinaHighlighted forState:UIControlStateHighlighted];
    [sinaButton setFrame:CGRectMake((self.view.frame.size.width - sinaNormal.size.width) / 2, self.view.frame.size.height - sinaNormal.size.height * 3 - 120, sinaNormal.size.width, sinaNormal.size.height)];
    [self.view addSubview:sinaButton];
    [sinaButton addTarget:self action:@selector(sinaButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* qqNormal = [UIImage getImageWithFileName:@"qq0"];
    UIImage* qqHighlighted = [UIImage getImageWithFileName:@"qq1"];
    qqButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [qqButton setBackgroundImage:qqNormal forState:UIControlStateNormal];
    [qqButton setBackgroundImage:qqHighlighted forState:UIControlStateHighlighted];
    [qqButton setFrame:CGRectMake((self.view.frame.size.width - qqNormal.size.width) / 2, self.view.frame.size.height - qqNormal.size.height * 3 - 60, qqNormal.size.width, qqNormal.size.height)];
    [self.view addSubview:qqButton];
    [qqButton addTarget:self action:@selector(qqButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* renrenNormal = [UIImage getImageWithFileName:@"renren0"];
    UIImage* renrenHighlighted = [UIImage getImageWithFileName:@"renren1"];
    renrenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [renrenButton setBackgroundImage:renrenNormal forState:UIControlStateNormal];
    [renrenButton setBackgroundImage:renrenHighlighted forState:UIControlStateHighlighted];
    [renrenButton setFrame:CGRectMake((self.view.frame.size.width - renrenNormal.size.width) / 2, self.view.frame.size.height - renrenNormal.size.height * 3, renrenNormal.size.width, renrenNormal.size.height)];
    [self.view addSubview:renrenButton];
    [renrenButton addTarget:self action:@selector(renrenButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    NSString* thirdPartStr = @"已有帐号绑定登录";
    CGSize thirdPartSize = [Utility getCGSizeWithFontSize:16.0 str:thirdPartStr isBold:YES];
    thirdPartyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, sinaButton.frame.origin.y - thirdPartSize.height - 10, thirdPartSize.width, thirdPartSize.height)];
    [thirdPartyLabel setBackgroundColor:[UIColor clearColor]];
    [thirdPartyLabel setText:thirdPartStr];
    [thirdPartyLabel setTextColor:[UIColor grayColor]];
    [thirdPartyLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    [self.view addSubview:thirdPartyLabel];
}

- (void)sinaButtonPressed:(id)sender
{
    
}

- (void)qqButtonPressed:(id)sender
{
    
}

- (void)renrenButtonPressed:(id)sender
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [usernameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
