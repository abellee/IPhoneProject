//
//  RegistInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RegistInterface.h"

@implementation RegistInterface

@synthesize delegate;

@synthesize titleLabel;
@synthesize nickname;
@synthesize account;
@synthesize password;
@synthesize backwardBtn;
@synthesize registBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setView:(UIView *)view
{
    [super setView:view];
    view.backgroundColor = [UIColor whiteColor];
    
    [self initInterface];
}

- (void)initInterface
{
    // 标题
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, 30);
    titleLabel = [[UILabel alloc] initWithFrame:rect];
    titleLabel.text = @"注册";
    titleLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    // 昵称
    CGRect nicknameRect = CGRectMake(20, rect.origin.y + rect.size.height + 5, 280, 30);
    nickname = [[UITextField alloc] initWithFrame:nicknameRect];
    nickname.placeholder = @"昵称（4-20个字符）";
    nickname.autocorrectionType = UITextAutocorrectionTypeNo;
    nickname.keyboardType = UIKeyboardTypeDefault;
    nickname.borderStyle = UITextBorderStyleRoundedRect;
    nickname.keyboardAppearance = UIKeyboardAppearanceAlert;
    nickname.returnKeyType = UIReturnKeyNext;
    nickname.delegate = self;
    nickname.tag = 0;
    [self.view addSubview:nickname];
    
    
    // 帐号
    CGRect accountRect = CGRectMake(20, nicknameRect.origin.y + nicknameRect.size.height + 5, 280, 30);
    account = [[UITextField alloc] initWithFrame:accountRect];
    account.placeholder = @"邮箱地址";
    account.autocorrectionType = UITextAutocorrectionTypeNo;
    account.keyboardType = UIKeyboardTypeEmailAddress;
    account.borderStyle = UITextBorderStyleRoundedRect;
    account.keyboardAppearance = UIKeyboardAppearanceAlert;
    account.returnKeyType = UIReturnKeyNext;
    account.delegate = self;
    account.tag = 1;
    [self.view addSubview:account];
    
    // 密码
    CGRect passwordRect = CGRectMake(20, accountRect.origin.y + accountRect.size.height + 5, 280, 30);
    password = [[UITextField alloc] initWithFrame:passwordRect];
    password.placeholder = @"密码(6-20个字符)";
    password.autocorrectionType = UITextAutocorrectionTypeNo;
    password.keyboardType = UIKeyboardTypeASCIICapable;
    password.borderStyle = UITextBorderStyleRoundedRect;
    password.keyboardAppearance = UIKeyboardAppearanceAlert;
    password.returnKeyType = UIReturnKeyDone;
    password.secureTextEntry = YES;
    password.delegate = self;
    password.tag = 2;
    [self.view addSubview:password];
    
    // 注册按钮
    CGRect registBtnRect = CGRectMake(20, passwordRect.origin.y + passwordRect.size.height + 5, 280, 30);
    registBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registBtn setFrame:registBtnRect];
    [registBtn setTitle:@"注 册" forState:UIControlStateNormal];
    registBtn.tag = 0;
    [registBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    
    // 返回按钮
    CGRect backwardRect = CGRectMake(20, registBtnRect.size.height + registBtnRect.origin.y + 5, 280, 30);
    backwardBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backwardBtn setFrame:backwardRect];
    [backwardBtn setTitle:@"返 回" forState:UIControlStateNormal];
    backwardBtn.tag = 1;
    [backwardBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backwardBtn];
}

- (void)buttonPressed:(id)sender
{
    UIView* view = (UIView*)sender;
    switch (view.tag) {
        case 0:
            // do regist;
            break;
        case 1:
            // return backward
            if(delegate != nil && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]){
                [self resignAll];
                [delegate exitRegistion:self.view.tag];
            }
            break;
        default:
            // damn, why you can reach here - -!!
            break;
    }
}

- (void)resignAll
{
    [nickname resignFirstResponder];
    [account resignFirstResponder];
    [password resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    switch (textField.tag) {
        case 0:
            [account becomeFirstResponder];
            return NO;
            break;
        case 1:
            [password becomeFirstResponder];
            return NO;
            break;
        case 2:
            return YES;
            break;
        default:
            // sorry, i don't know what to do - -!
            break;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
