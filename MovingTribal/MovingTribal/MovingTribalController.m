//
//  MovingTribalController.m
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MovingTribalController.h"
#import "TransitionVariable.h"

typedef enum{
    INTRO_STATE,
    LOGIN_STATE,
    MAIN_STATE,
    CHAT_STATE,
}InterfaceState;

@implementation MovingTribalController

@synthesize introContainer;
@synthesize loginContainer;
@synthesize mainContainer;
@synthesize chatInterface;
@synthesize currentState;

- (void)dealloc
{
    NSLog(@"******| MovingTribal |****** receive dealloc message!");
    if(introContainer != nil) [introContainer release];
    if(loginContainer != nil) [loginContainer release];
    if(mainContainer != nil) [mainContainer release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if(self){
        // 正式版需要判断是否显示介绍界面
        [self performSelector:@selector(showLoginContainer)];
    }
    return self;
}

#pragma 显示登录界面
- (void)showLoginContainer
{
    loginContainer = [[LoginContainer alloc] init];
    loginContainer.delegate = self;
    [loginContainer.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:loginContainer.view];
}

#pragma 登录成功 显示主界面
- (void)showMainContainer
{
    CGRect mainContainerRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    mainContainer = [[MainContainer alloc] init];
    mainContainer.delegate = self;
    [mainContainer.view setFrame:mainContainerRect];
    [self.view insertSubview:mainContainer.view atIndex:0];
    
    if(loginContainer != nil){
        CGRect rect = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
        [loginContainer.view setFrame:rect];
        currentState = LOGIN_STATE;
        TransitionVariable* transitionVar0 = [[TransitionVariable alloc] init];
        [transitionVar0 subType: kCATransitionFromBottom];
        [transitionVar0 duration: 0.3];
        [transitionVar0 view:loginContainer.view];
        [self performSelector:@selector(easeOut:) withObject:transitionVar0];
        [transitionVar0 release];
        return;
    }
}

#pragma 显示与指定好友之间的聊天界面
- (void)showChatInterface:(UserData *)userData
{
    
    if(chatInterface == nil){
        chatInterface = [[ChatInterface alloc] init];
        chatInterface.view.backgroundColor = [UIColor whiteColor];
        chatInterface.delegate = self;
        [chatInterface userData:userData];
        [chatInterface initInterface];
    }
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [chatInterface.view setFrame:rect];
    [self.view addSubview:chatInterface.view];
    TransitionVariable* transitionVar0 = [[TransitionVariable alloc] init];
    [transitionVar0 subType: kCATransitionFromRight];
    [transitionVar0 duration: 0.3];
    [transitionVar0 view:chatInterface.view];
    [self performSelector:@selector(easeIn:) withObject:transitionVar0];
    [transitionVar0 release];
    
    CGRect outRect = CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    [mainContainer.view setFrame:outRect];
    currentState = MAIN_STATE;
    TransitionVariable* transitionVar = [[TransitionVariable alloc] init];
    [transitionVar subType: kCATransitionFromRight];
    [transitionVar duration: 0.5];
    [transitionVar view:mainContainer.view];
    [self performSelector:@selector(easeOut:) withObject:transitionVar];
    [transitionVar release];
}

#pragma 退出与指定好友之间的聊天界面
- (void)exitChatInterface
{
    CGRect outRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [mainContainer.view setFrame:outRect];
    TransitionVariable* transitionVar = [[TransitionVariable alloc] init];
    [transitionVar subType: kCATransitionFromLeft];
    [transitionVar duration: 0.2];
    [transitionVar view:mainContainer.view];
    [self performSelector:@selector(easeIn:) withObject:transitionVar];
    [transitionVar release];
    
    CGRect rect = CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    [chatInterface.view setFrame:rect];
    currentState = CHAT_STATE;
    [self.view addSubview:chatInterface.view];
    TransitionVariable* transitionVar0 = [[TransitionVariable alloc] init];
    [transitionVar0 subType: kCATransitionFromLeft];
    [transitionVar0 duration: 0.3];
    [transitionVar0 view:chatInterface.view];
    [self performSelector:@selector(easeOut:) withObject:transitionVar0];
    [transitionVar0 release];
}

#pragma mark - 动画播放完成后移除相关界面
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CATransition* animation = (CATransition *)anim;
    if(animation){
        if([[animation type] isEqualToString:@"push"]){
            switch (currentState) {
                case LOGIN_STATE:
                    [loginContainer.view removeFromSuperview];
                    [loginContainer release];
                    loginContainer = nil;
                    break;
                case MAIN_STATE:
                    
                    break;
                case INTRO_STATE:
                    
                    break;
                case CHAT_STATE:
                    [chatInterface.view removeFromSuperview];
                    [chatInterface release];
                    chatInterface = nil;
                    break;
                default:
                    break;
            }
        }
    }
}

#pragma mark - tool function
- (void)easeOut:(TransitionVariable *)var
{
    CATransition* animation = [CATransition animation];
    animation.duration = var.duration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = var.subType;
    animation.delegate = self;
    [var.view.layer addAnimation:animation forKey:nil];
}

- (void)easeIn:(TransitionVariable *)var
{
    CATransition* animation = [CATransition animation];
    animation.duration = var.duration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionMoveIn;
    animation.subtype = var.subType;
    animation.delegate = self;
    [var.view.layer addAnimation:animation forKey:nil];
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
    NSLog(@"received memory warining!!!!!!!!");
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
