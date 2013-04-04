//
//  RegistViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "RegistViewController.h"
#import "Utility.h"
#import "UIImage+Extensions.h"
#import "Global.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        title = @"注册新用户";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.scrollEnabled = NO;
    [self.view addSubview:scrollView];
    
    float gap = 15.0;
    
    NSString* usernameStr = @"用 户 名:";
    CGSize usernameStrSize = [Utility getCGSizeWithFontSize:15.0 str:usernameStr isBold:NO];
    UILabel* usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, usernameStrSize.width, usernameStrSize.height)];
    [usernameLabel setText:usernameStr];
    [usernameLabel setTextColor:[UIColor darkGrayColor]];
    [usernameLabel setBackgroundColor:[UIColor clearColor]];
    [usernameLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    username = [[UITextField alloc] initWithFrame:CGRectMake(10, 20, self.view.frame.size.width - 20, 40)];
    [username setBorderStyle:UITextBorderStyleRoundedRect];
    username.autocapitalizationType = UITextAutocapitalizationTypeNone;
    username.autocorrectionType = UITextAutocorrectionTypeNo;
    username.leftView = usernameLabel;
    username.leftViewMode = UITextFieldViewModeAlways;
    username.clearButtonMode = UITextFieldViewModeAlways;
    username.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    username.returnKeyType = UIReturnKeyNext;
    username.delegate = self;
    [scrollView addSubview:username];
    [usernameLabel release];
    
    NSString* passwordStr = @"密      码:";
    CGSize passwordStrSize = [Utility getCGSizeWithFontSize:15.0 str:passwordStr isBold:NO];
    UILabel* passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, passwordStrSize.width, passwordStrSize.height)];
    [passwordLabel setText:passwordStr];
    [passwordLabel setTextColor:[UIColor darkGrayColor]];
    [passwordLabel setBackgroundColor:[UIColor clearColor]];
    [passwordLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    password = [[UITextField alloc] initWithFrame:CGRectMake(10, username.frame.origin.y + username.frame.size.height + gap, self.view.frame.size.width - 20, 40)];
    [password setBorderStyle:UITextBorderStyleRoundedRect];
    password.autocapitalizationType = UITextAutocapitalizationTypeNone;
    password.autocorrectionType = UITextAutocorrectionTypeNo;
    password.leftView = passwordLabel;
    password.leftViewMode = UITextFieldViewModeAlways;
    password.clearButtonMode = UITextFieldViewModeAlways;
    password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    password.returnKeyType = UIReturnKeyNext;
    password.delegate = self;
    [scrollView addSubview:password];
    [passwordLabel release];
    
    NSString* repasswordStr = @"确认密码:";
    CGSize repasswordStrSize = [Utility getCGSizeWithFontSize:15.0 str:repasswordStr isBold:NO];
    UILabel* repasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, repasswordStrSize.width, repasswordStrSize.height)];
    [repasswordLabel setText:repasswordStr];
    [repasswordLabel setTextColor:[UIColor darkGrayColor]];
    [repasswordLabel setBackgroundColor:[UIColor clearColor]];
    [repasswordLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    repassword = [[UITextField alloc] initWithFrame:CGRectMake(10, password.frame.origin.y + password.frame.size.height + gap, self.view.frame.size.width - 20, 40)];
    [repassword setBorderStyle:UITextBorderStyleRoundedRect];
    repassword.autocapitalizationType = UITextAutocapitalizationTypeNone;
    repassword.autocorrectionType = UITextAutocorrectionTypeNo;
    repassword.leftView = repasswordLabel;
    repassword.leftViewMode = UITextFieldViewModeAlways;
    repassword.clearButtonMode = UITextFieldViewModeAlways;
    repassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    repassword.returnKeyType = UIReturnKeyNext;
    repassword.delegate = self;
    [scrollView addSubview:repassword];
    [repasswordLabel release];
    
    NSString* emailStr = @"电子邮箱:";
    CGSize emailStrSize = [Utility getCGSizeWithFontSize:15.0 str:emailStr isBold:NO];
    UILabel* emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, emailStrSize.width, emailStrSize.height)];
    [emailLabel setText:emailStr];
    [emailLabel setTextColor:[UIColor darkGrayColor]];
    [emailLabel setBackgroundColor:[UIColor clearColor]];
    [emailLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    email = [[UITextField alloc] initWithFrame:CGRectMake(10, repassword.frame.origin.y + repassword.frame.size.height + gap, self.view.frame.size.width - 20, 40)];
    [email setBorderStyle:UITextBorderStyleRoundedRect];
    email.autocapitalizationType = UITextAutocapitalizationTypeNone;
    email.autocorrectionType = UITextAutocorrectionTypeNo;
    email.leftView = emailLabel;
    email.leftViewMode = UITextFieldViewModeAlways;
    email.clearButtonMode = UITextFieldViewModeAlways;
    email.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    email.returnKeyType = UIReturnKeyDone;
    email.delegate = self;
    [scrollView addSubview:email];
    [emailLabel release];
    
    UIImage* registNormal = [UIImage getImageWithFileName:@"lvzhuce0"];
    UIImage* registHighlighted = [UIImage getImageWithFileName:@"lvzhuce1"];
    registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registButton setBackgroundImage:registNormal forState:UIControlStateNormal];
    [registButton setBackgroundImage:registHighlighted forState:UIControlStateHighlighted];
    [registButton setFrame:CGRectMake(10, email.frame.origin.y + email.frame.size.height + gap, registNormal.size.width, registNormal.size.height)];
    [scrollView addSubview:registButton];
    
    [self.view addSubview:scrollView];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    BOOL needScroll = NO;
    if (textField == username) {
        needScroll = NO;
    }else if(textField == password){
        needScroll = NO;
    }else if(textField == repassword){
        needScroll = NO;
    }else if(textField == email){
        needScroll = YES;
    }
    if (![[Global sharedInstance] isIPhone5] && needScroll) {
        [scrollView setContentOffset:CGPointMake(0, 100) animated:YES];
    }else if(scrollView.contentOffset.y != 0){
        [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == username) {
        [password becomeFirstResponder];
        return NO;
    }else if(textField == password){
        [repassword becomeFirstResponder];
        return NO;
    }else if(textField == repassword){
        [email becomeFirstResponder];
        return NO;
    }else if(textField == email){
        [email resignFirstResponder];
        [self doRegist];
        return YES;
    }
    return YES;
}

- (void)doRegist
{
    if (scrollView.contentOffset.y != 0) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
