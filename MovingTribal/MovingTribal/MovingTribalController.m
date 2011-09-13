//
//  MovingTribalController.m
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MovingTribalController.h"

@implementation MovingTribalController

@synthesize registInterface;
@synthesize loginInterface;
@synthesize othersInterface;
@synthesize mapInterface;

@synthesize currentView;

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

- (void)setView:(UIView *)view
{
    [super setView: view];
    
    [self showLoginInterface];
}

#pragma mark - 进入登录界面
- (void)showLoginInterface
{
    CGRect rect = CGRectMake(0, 0, 320, 460);
    UIView* view = [[UIView alloc] initWithFrame:rect];
    loginInterface = [LoginInterface alloc];
    loginInterface.delegate = self;
    [loginInterface setView:view];
    [self.view addSubview:loginInterface.view];
}

#pragma mark - 进入注册界面
- (void)showRegistInterface:(NSInteger)tag
{
    CGRect rect = CGRectMake(0, 0, 320, 460);
    UIView* view = [[UIView alloc] initWithFrame:rect];
    registInterface = [RegistInterface alloc];
    registInterface.delegate = self;
    [registInterface setView:view];
    currentView = registInterface.view;
    [self.view addSubview:registInterface.view];
    [self easeIn:registInterface.view];
}

#pragma mark - 退出注册界面
- (void)exitRegistion:(NSInteger)tag
{
    CGRect rect = CGRectMake(0, 460, 320, 460);
    [registInterface.view setFrame:rect];
    [self easeOut:registInterface.view];
}

#pragma mark - 进入其它平台登录界面
- (void)showOtherLoginInterface:(NSInteger)tag
{
    CGRect rect = CGRectMake(0, 0, 320, 460);
    UIView* view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    othersInterface = [OthersLoginInterface alloc];
    othersInterface.delegate = self;
    [othersInterface setView:view];
    currentView = othersInterface.view;
    [self.view addSubview:othersInterface.view];
    [self easeIn:othersInterface.view];
}

#pragma mark - 退出其它平台登录界面
- (void)exitOtherLoginInterface:(NSInteger)tag
{
    CGRect rect = CGRectMake(0, 460, 320, 460);
    [othersInterface.view setFrame:rect];
    [self easeOut:othersInterface.view];
}

#pragma mark - 进入地图界面
- (void)showMapInterface:(NSInteger)tag
{
    CGRect rect = CGRectMake(0, 0, 320, 460);
    UIView* view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    mapInterface = [MapInterface alloc];
    mapInterface.delegate = self;
    [mapInterface setView:view];
    currentView = loginInterface.view;
    [self.view addSubview:mapInterface.view];
    [self easeOut:loginInterface.view];
}

#pragma mark - 动画播放完成后移除相关界面
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CATransition* animation = (CATransition *)anim;
    if(animation){
        if([[animation type] isEqualToString:@"push"] && currentView != nil){
            NSLog(@"remove currentView from super view");
            [currentView removeFromSuperview];
            currentView = nil;
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
