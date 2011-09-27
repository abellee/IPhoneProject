//
//  RegistInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "RegistInterface.h"
#import "NetWork.h"

@implementation RegistInterface

@synthesize delegate;

@synthesize titleLabel;
@synthesize nickname;
@synthesize account;
@synthesize password;
@synthesize backwardBtn;
@synthesize registBtn;

- (void)dealloc
{
    NSLog(@"******| Regist Interface |****** receive dealloc message!");
    if(titleLabel != nil) [titleLabel release];
    if(nickname != nil) [nickname release];
    if(account != nil) [account release];
    if(password != nil) [password release];
    delegate = nil;
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
    CGFloat w = self.view.frame.size.width - 40;
    // 标题
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, 30);
    titleLabel = [[UILabel alloc] initWithFrame:rect];
    titleLabel.text = @"注册";
    titleLabel.backgroundColor = [UIColor grayColor];
    titleLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    // 昵称
    CGRect nicknameRect = CGRectMake(20, rect.origin.y + rect.size.height + 5, w, 30);
    nickname = [[UITextField alloc] initWithFrame:nicknameRect];
    nickname.placeholder = @"昵称（4-12个字符）";
    nickname.autocorrectionType = UITextAutocorrectionTypeNo;
    nickname.keyboardType = UIKeyboardTypeDefault;
    nickname.borderStyle = UITextBorderStyleRoundedRect;
    nickname.keyboardAppearance = UIKeyboardAppearanceAlert;
    nickname.returnKeyType = UIReturnKeyNext;
    nickname.delegate = self;
    nickname.tag = 0;
    [self.view addSubview:nickname];
    
    
    // 帐号
    CGRect accountRect = CGRectMake(20, nicknameRect.origin.y + nicknameRect.size.height + 5, w, 30);
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
    CGRect passwordRect = CGRectMake(20, accountRect.origin.y + accountRect.size.height + 5, w, 30);
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
    CGRect registBtnRect = CGRectMake(20, passwordRect.origin.y + passwordRect.size.height + 5, w, 30);
    registBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registBtn setFrame:registBtnRect];
    [registBtn setTitle:@"注 册" forState:UIControlStateNormal];
    registBtn.tag = 0;
    [registBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    
    // 返回按钮
    CGRect backwardRect = CGRectMake(20, registBtnRect.size.height + registBtnRect.origin.y + 5, w, 30);
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
			if(nickname.text && password.text && account.text && nickname.text != @"" && account.text != @"" && password.text != @""){
				int result = [NetWork regist:nickname.text account:account.text password:password.text];
				NSLog(@"%d", result);
				switch (result) {
					case RegistSuccess:
						[self performSelector:@selector(alert:) withObject:@"注册成功!"];
						[self performSelector:@selector(buttonPressed:) withObject:backwardBtn];
						break;
					case NicknameLenError:
						[self performSelector:@selector(alert:) withObject:@"昵称长度必需为4-12个字符!"];
						break;
					case NicknamePatternError:
						[self performSelector:@selector(alert:) withObject:@"昵称格式不正确!"];
						break;
					case AccountPatternError:
						[self performSelector:@selector(alert:) withObject:@"帐号格式不正确!"];
						break;
					case AccountExsit:
						[self performSelector:@selector(alert:) withObject:@"该帐号已经存在!"];
						break;
					case RegistFailed:
						[self performSelector:@selector(alert:) withObject:@"注册失败, 请检查信息填写是否正确!"];
						break;
					case PasswordLenError:
						[self performSelector:@selector(alert:) withObject:@"密码长度必需为6-20个字符!"];
						break;
					case ServerError:
						[self performSelector:@selector(alert:) withObject:@"服务器错误!"];
						break;
					default:
						break;
				}
			}else{
				[self performSelector:@selector(alert:) withObject:@"信息填写不完整!"];
			}
            break;
        case 1:
            // return backward
            if(delegate != nil && [delegate conformsToProtocol:@protocol(LoginContainerDelegate)]){
                [self resignAll];
                [delegate exitRegistInterface];
            }
            break;
        default:
            // damn, why you can reach here - -!!
            break;
    }
}

- (void)alert:(NSString *)message
{
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
	[alert show];
	[alert release];
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
