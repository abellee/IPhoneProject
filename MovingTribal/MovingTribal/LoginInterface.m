//
//  LoginInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "LoginInterface.h"
#import "NetWork.h"

@implementation LoginInterface

@synthesize loginButton;
@synthesize registButton;
@synthesize othersLoginButton;
@synthesize username;
@synthesize password;
@synthesize forgetPassword;
@synthesize soundRecorder;
@synthesize emotionsView;

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"******| Login Interface |****** receive dealloc message!");
    [username release];
    [password release];
    [forgetPassword release];
    delegate = nil;
	username = nil;
	password = nil;
	forgetPassword = nil;
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];
    if(self){
        [self initInterface];
    }
    return self;
}

- (void)initInterface
{
    // 用户名输入框
    CGRect usernameRect = CGRectMake(20, 50,  self.view.frame.size.width - 40, 30);
    username = [[UITextField alloc] initWithFrame:usernameRect];
    username.borderStyle = UITextBorderStyleRoundedRect;
    username.placeholder = @"邮箱";
    username.returnKeyType = UIReturnKeyNext;
    username.autocorrectionType = UITextAutocorrectionTypeNo;
    username.keyboardType = UIKeyboardTypeEmailAddress;
	username.clearButtonMode = UITextFieldViewModeWhileEditing;
	username.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    username.delegate = self;
    username.tag = 0;
	username.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    [self.view addSubview:username];
    
    // 密码输入框
    CGRect passwordRect = CGRectMake(usernameRect.origin.x, usernameRect.origin.y + usernameRect.size.height + 5, usernameRect.size.width, usernameRect.size.height);
    password = [[UITextField alloc] initWithFrame:passwordRect];
    password.borderStyle = UITextBorderStyleRoundedRect;
    password.placeholder = @"密码";
    password.returnKeyType = UIReturnKeyDone;
    password.autocorrectionType = UITextAutocorrectionTypeNo;
    password.keyboardType = UIKeyboardTypeASCIICapable;
	password.clearButtonMode = UITextFieldViewModeWhileEditing;
    password.secureTextEntry = YES;
    password.delegate = self;
    password.tag = 1;
	password.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    [self.view addSubview:password];
    
    // 登录按钮
    CGRect loginButtonRect = CGRectMake(passwordRect.origin.x, passwordRect.origin.y + passwordRect.size.height + 10, passwordRect.size.width, 30);
    loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.tag = 0;
    [loginButton setFrame:loginButtonRect];
    [loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [loginButton addTarget:self action:@selector(recordSound:) forControlEvents:UIControlEventTouchDown];
//    [loginButton addTarget:self action:@selector(playSound:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    // 微博平台帐号登录按钮
    CGRect otherButtonRect = CGRectMake(loginButtonRect.origin.x, loginButtonRect.origin.y + loginButtonRect.size.height + 10, loginButtonRect.size.width, 30);
    othersLoginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    othersLoginButton.tag = 1;
    [othersLoginButton setFrame:otherButtonRect];
    [othersLoginButton setTitle:@"使用其它帐号登录" forState:UIControlStateNormal];
    [othersLoginButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:othersLoginButton];
    
    // 注册按钮
    CGRect registButtonRect = CGRectMake(otherButtonRect.origin.x, otherButtonRect.origin.y + otherButtonRect.size.height + 10, otherButtonRect.size.width, 30);
    registButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    registButton.tag = 2;
    [registButton setFrame:registButtonRect];
    [registButton setTitle:@"快速注册" forState:UIControlStateNormal];
    [registButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registButton];
    
    // 忘记密码
    CGRect forgetTextFieldRect = CGRectMake(registButtonRect.origin.x, registButtonRect.origin.y + registButtonRect.size.height + 5, registButtonRect.size.width, registButtonRect.size.height);
    forgetPassword = [[TouchableUILabel alloc] initWithFrame:forgetTextFieldRect];
    forgetPassword.textAlignment = UITextAlignmentCenter;
    forgetPassword.text = @"找回密码";
    forgetPassword.tag = 3;
    forgetPassword.delegate = self;
    [self.view addSubview:forgetPassword];
    
//    soundRecorder = [[SoundRecorder alloc] init];
}

- (void)recordSound:(id)sender
{
    [soundRecorder prepareRecord];
    [soundRecorder startRecord];
}

- (void)playSound:(id)sender
{
    [soundRecorder stopRecord];
}

- (void)touchLabel:(TouchableUILabel *)touchableLabel touchableLabelTag:(NSInteger)tag
{
    NSLog(@"you touch the forgetPassword label");
}

- (void)buttonPressed:(id)sender
{
    UIView* view = (UIView *)sender;
    switch (view.tag) {
        case 0:
            // do login
			if(username.text && password.text && username.text != @"" && password.text != @""){
				int reulst = [NetWork login:username.text password:password.text];
				switch (reulst) {
					case AccountPatternError:
						[self performSelector:@selector(alert:) withObject:@"帐号格式不正确!"];
						break;
					case PasswordLenError:
						[self performSelector:@selector(alert:) withObject:@"密码长度必需为6-20个字符!"];
						break;
					case LoginFailed:
						[self performSelector:@selector(alert:) withObject:@"帐号或者密码不正确!"];
						break;
					case LoginSuccess:
						[[NSUserDefaults standardUserDefaults] setObject:username.text forKey:@"username"];
						[[NSUserDefaults standardUserDefaults] setObject:password.text forKey:@"password"];
						[self doLogin];
						break;
					default:
						break;
				}
			}else{
				[self performSelector:@selector(alert:) withObject:@"帐号密码不能为空!"];
			}
            break;
        case 1:
            // others platform login
            if(delegate != nil && [delegate conformsToProtocol:@protocol(LoginContainerDelegate)]){
                [self resignTextField];
                [delegate showOtherPlatformInterface];
            }
            break;
        case 2:
            // do regist
            if(delegate != nil && [delegate conformsToProtocol:@protocol(LoginContainerDelegate)]){
                [self resignTextField];
                [delegate showRegistInterface];
            }
            break;
        default:
            // who could tell me what i should do - -!!!
            break;
    }
}

- (void)alert:(NSString *)message
{
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
	[alert show];
	[alert release];
}

#pragma mark - 提交服务器验证 并登录
- (void)doLogin
{
    [self resignTextField];
    if(delegate && [delegate conformsToProtocol:@protocol(LoginContainerDelegate)]){
		[delegate loginSuccess];
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self resignTextField];
}

- (void)resignTextField
{
    [username resignFirstResponder];
    [password resignFirstResponder];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    switch (textField.tag) {
        case 0:                                 //如果按下next键，将password设置为第一响应者
            [password becomeFirstResponder];
            return NO;
            break;
        case 1:                                 //如果按下done键，隐藏键盘，并进行登录验证！
			[self performSelector:@selector(buttonPressed:) withObject:loginButton];
            return YES;
            break;
        default:
            return YES;
            break;
    }
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
