//
//  LoginViewController.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize username;
@synthesize password;
@synthesize findPassword;
@synthesize loginButton;
@synthesize registButton;

@synthesize sinaWeibo;
@synthesize qqWeibo;
@synthesize neteaseWeibo;
@synthesize renren;

@synthesize access_token;
@synthesize platformList;

@synthesize registLayer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (id) init{
    if(self = [super init]){
        platformList = [NSArray arrayWithObjects:@"新浪微博", @"腾讯微博", @"网易微博", @"人人网", nil];
        [platformList retain];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TOTLE_WIDTH, TOTLE_HEIGHT)];
        [view setBackgroundColor:[UIColor whiteColor]];
        [self setView:view];
        username = [[UITextField alloc] initWithFrame:CGRectMake(20, 30, 200, 30)];
        username.borderStyle = UITextBorderStyleRoundedRect;
        username.placeholder = @"邮箱";
        username.autocapitalizationType = UITextAutocapitalizationTypeNone;
        username.autocorrectionType = UITextAutocorrectionTypeNo;
        username.returnKeyType = UIReturnKeyNext;
        username.delegate = self;
        username.tag = 0;
        [self.view addSubview:username];
        
        password = [[UITextField alloc] initWithFrame:CGRectMake(20, 70, 200, 30)];
        password.borderStyle = UITextBorderStyleRoundedRect;
        password.placeholder = @"密码";
        password.secureTextEntry = YES;
        password.autocapitalizationType = UITextAutocapitalizationTypeNone;
        password.autocorrectionType = UITextAutocorrectionTypeNo;
        password.returnKeyType = UIReturnKeyDone;
        password.delegate = self;
        password.tag = 1;
        [self.view addSubview:password];
        
        findPassword = [[UILabel alloc] initWithFrame:CGRectMake(20, 110, 100, 30)];
        findPassword.text = @"忘记密码?";
        [self.view addSubview:findPassword];
        
        loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [loginButton setFrame:CGRectMake(20, 150, 100, 30)];
        [loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [self.view addSubview:loginButton];
        [loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        registButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [registButton setFrame:CGRectMake(130, 150, 100, 30)];
        [registButton setTitle:@"注册" forState:UIControlStateNormal];
        [self.view addSubview:registButton];
        [registButton addTarget:self action:@selector(registButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        sinaWeibo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [sinaWeibo setTag:0];
        [sinaWeibo setFrame:CGRectMake(20, 200, 200, 30)];
        [sinaWeibo setTitle:@"新浪微博登录" forState:UIControlStateNormal];
        [sinaWeibo setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sina" ofType:@"png"]] forState:UIControlStateNormal];
        [sinaWeibo addTarget:self action:@selector(weiboButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:sinaWeibo];
        
        qqWeibo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [qqWeibo setTag:1];
        [qqWeibo setFrame:CGRectMake(20, 240, 200, 30)];
        [qqWeibo setTitle:@"腾讯微博登录" forState:UIControlStateNormal];
        [qqWeibo setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"qq" ofType:@"png"]] forState:UIControlStateNormal];
        [qqWeibo addTarget:self action:@selector(weiboButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:qqWeibo];
        
        neteaseWeibo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [neteaseWeibo setTag:2];
        [neteaseWeibo setFrame:CGRectMake(20, 280, 200, 30)];
        [neteaseWeibo setTitle:@"网易微博登录" forState:UIControlStateNormal];
        [neteaseWeibo setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"163" ofType:@"png"]] forState:UIControlStateNormal];
        [neteaseWeibo addTarget:self action:@selector(weiboButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:neteaseWeibo];
        
        renren = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [renren setTag:3];
        [renren setFrame:CGRectMake(20, 320, 200, 30)];
        [renren setTitle:@"人人网登录" forState:UIControlStateNormal];
        [renren setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"renren" ofType:@"png"]] forState:UIControlStateNormal];
        [renren addTarget:self action:@selector(weiboButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:renren];
    }
    
    return self;
}

- (void)weiboButtonClick:(id)sender
{
    if(navigationController) return;
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, TOTLE_HEIGHT, TOTLE_WIDTH, HEIGHT_IN_NAVIGATION)];
    web.delegate = self;
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=1244863350&response_type=token&redirect_uri=http%3A%2F%2Fwww%2Eiabel%2Ecom&display=mobile"]]];
    UIViewController *webViewController = [[UIViewController alloc] init];
    [webViewController setView:web];
    navigationController = [[UINavigationController alloc] initWithRootViewController:webViewController];
    [webViewController release];
    [web release];
    UIButton *btn = (UIButton *)sender;
    navigationController.navigationBar.topItem.title = [platformList objectAtIndex: btn.tag];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(cancelWeiboAuth:)];
    navigationController.navigationBar.topItem.leftBarButtonItem = backButton;
    [backButton release];
    [self presentModalViewController:navigationController animated:YES];
}

- (void)cancelWeiboAuth:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    [navigationController release];
    navigationController = nil;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSURL *url = [[webView request] URL];
    NSString *host = [url host];
    if([host isEqualToString:@"www.iabel.com"]){
        NSArray *pathArray = [[url absoluteString] componentsSeparatedByString:@"#"];
        if([pathArray count] == 2){
            NSString *query = [pathArray objectAtIndex:1];
            NSArray *paramsArray = [query componentsSeparatedByString:@"&"];
            for(NSString *key in paramsArray){
                NSArray *keyArray = [key componentsSeparatedByString:@"="];
                if([[keyArray objectAtIndex:0] isEqualToString:@"error"]){
                    if([[keyArray objectAtIndex:1] isEqualToString:@"access_denied"]){
                        [self performSelector:@selector(cancelWeiboAuth:)];
                    }else{
                        NSLog(@"授权失败");
                    }
                    return;
                }else if([[keyArray objectAtIndex:0] isEqualToString:@"access_token"]){
                    [webView removeFromSuperview];
                    access_token = [[keyArray objectAtIndex:1] retain];
                    return;
                }
            }
        }
    }else{
        [[[Global sharedGlobal] popUpLayer] showActivityViewWithMask:YES];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    switch (textField.tag) {
        case 0:
            [password becomeFirstResponder];
            return NO;
            break;
        case 1:
            [self performSelector:@selector(loginButtonClick:) withObject:loginButton];
            return YES;
            break;
        default:
            break;
    }
    return YES;
}

-(void)loginButtonClick:(id)sender
{
    [[[Global sharedGlobal] socketManager] doLogin:[username text] pass:[password text]];
}

-(void)registButtonClick:(id)sender
{
    if(registLayer == nil){
        registLayer = [[RegistLayer alloc] init];
        navigationController = [[UINavigationController alloc] initWithRootViewController:registLayer];
        [registLayer release];
        registLayer = nil;
        navigationController.navigationBar.topItem.title = @"加入口袋宠物世界";
        UIBarButtonItem* backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(cancelRegist:)];
        UIBarButtonItem* doRegistButton = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(doRegist:)];
        navigationController.navigationBar.topItem.leftBarButtonItem = backButton;
        navigationController.navigationBar.topItem.rightBarButtonItem = doRegistButton;
        [backButton release];
        [doRegistButton release];
        backButton = nil;
        doRegistButton = nil;
        [self presentModalViewController:navigationController animated:YES];
    }
}

-(void)cancelRegist:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    [navigationController release];
    navigationController = nil;
}

-(void)doRegist:(id)sender
{
    
}

-(void)doLogin:(NSString *)username pass:(NSString *)password
{
    [self performSelector:@selector(loginButtonClick:) withObject:loginButton];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[[Global sharedGlobal] popUpLayer] hideActivityView];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([username isFirstResponder]) {
        [username resignFirstResponder];
    }else if([password isFirstResponder]){
        [password resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc
{
    [super dealloc];
}

@end
