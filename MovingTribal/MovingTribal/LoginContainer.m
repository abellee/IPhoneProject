//
//  LoginContainer.m
//  MovingTribal
//
//  Created by Lee Abel on 9/17/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "LoginContainer.h"

@implementation LoginContainer

@synthesize loginInterface;
@synthesize registInterface;
@synthesize othersLoginInterface;

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"******| LoginContainer |****** receive dealloc message!");
    [loginInterface release];
    [registInterface release];
    [othersLoginInterface release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if(self){
        [self performSelector:@selector(showLoginInterface)];
    }
    return self;
}

#pragma 显示登录界面
- (void)showLoginInterface
{
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    if(loginInterface == nil){
        NSLog(@"loginInterface is nil!");
        loginInterface = [[LoginInterface alloc] init];
        loginInterface.delegate = self;
        loginInterface.view.backgroundColor = [UIColor whiteColor];
    }
    [loginInterface.view setFrame:rect];
    [self.view addSubview:loginInterface.view];
}

#pragma 显示注册界面
- (void)showRegistInterface
{
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    if(registInterface == nil){
        NSLog(@"registInterface is nil!");
        registInterface = [[RegistInterface alloc] init];
        registInterface.delegate = self;
        registInterface.view.backgroundColor = [UIColor whiteColor];
    }
    [registInterface.view setFrame:rect];
    [self performSelector:@selector(addRegistInterface)];
}

- (void)addRegistInterface
{
    [self.view addSubview:registInterface.view];
    [self performSelector:@selector(easeIn:) withObject:registInterface.view];
    NSLog(@"regist retain count %d", registInterface.retainCount);
}

#pragma 退出注册界面
- (void)exitRegistInterface
{
    CGRect rect = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    [registInterface.view setFrame:rect];
    [self performSelector:@selector(easeOut:) withObject:registInterface.view];
    [registInterface release];
    registInterface = nil;
}

#pragma 显示其它平台登录界面
- (void)showOtherPlatformInterface
{
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    if(othersInterface == nil){
        othersInterface = [OthersLoginInterface alloc];
        othersInterface.delegate = self;
        othersInterface.view.backgroundColor = [UIColor whiteColor];
    }
    [othersInterface.view setFrame:rect];
    [self.view addSubview:othersInterface.view];
    [self performSelector:@selector(easeIn:) withObject:othersInterface.view];
}

#pragma 退出其它平台登录界面
- (void)exitOtherPlatformInterface
{
    CGRect rect = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    [othersInterface.view setFrame:rect];
    [self performSelector:@selector(easeOut:) withObject:othersInterface.view];
    [othersInterface release];
    othersInterface = nil;
}

#pragma 显示找回密码界面
- (void)showForgetPasswordInterface
{
    
}

#pragma 登录成功
- (void)loginSuccess
{
    if(delegate != nil && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]){
        [delegate showMainContainer];
    }
}

#pragma 登录失败
- (void)loginFailed
{
    
}

#pragma 注册成功
- (void)registSuccess
{
    
}

#pragma 注册失败
- (void)registFailed
{
    
}

#pragma 找回密码成功
- (void)findPasswordSuccess
{
    
}

#pragma 找回密码失败
- (void)findPasswordFailed
{
    
}

#pragma mark - 动画播放完成后移除相关界面
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CATransition* animation = (CATransition *)anim;
    if(animation){
        if([[animation type] isEqualToString:@"push"]){
            UIView* view = [self.view.subviews objectAtIndex:1];
            if(view != nil){
                NSLog(@"remove currentView from super view");
                [view removeFromSuperview];
            }
        }
    }
}

#pragma mark - tool function
- (void)easeOut:(UIView *)view
{
    CATransition* animation = [CATransition animation];
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    animation.delegate = self;
    [view.layer addAnimation:animation forKey:nil];
}

- (void)easeIn:(UIView *)view
{
    CATransition* animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionMoveIn;
    animation.subtype = kCATransitionFromTop;
    animation.delegate = self;
    [view.layer addAnimation:animation forKey:nil];
}

/*----------------------------------------------------------------------------*/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
