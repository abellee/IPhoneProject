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
@synthesize chatInterface;
@synthesize chatListInterface;
@synthesize friendInterface;
@synthesize systemSettingInterface;

@synthesize tabBar;

@synthesize currentState;
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
    if(loginInterface == nil){
        NSLog(@"loginInterface is nil!");
        UIView* view = [[UIView alloc] initWithFrame:rect];
        view.backgroundColor = [UIColor whiteColor];
        loginInterface = [LoginInterface alloc];
        loginInterface.delegate = self;
        [loginInterface setView:view];
        [view release];
        [self.view addSubview:loginInterface.view];
        [loginInterface release];
        NSLog(@"login retain count %d", loginInterface.retainCount);
    }else{
        [loginInterface.view setFrame:rect];
        [self.view addSubview:loginInterface.view];
        NSLog(@"login retain count %d", loginInterface.retainCount);
    }
}

#pragma mark - 进入注册界面
- (void)showRegistInterface:(NSInteger)tag
{
    CGRect rect = CGRectMake(0, 0, 320, 460);
    if(registInterface == nil){
        NSLog(@"registInterface is nil!");
        UIView* view = [[UIView alloc] initWithFrame:rect];
        view.backgroundColor = [UIColor whiteColor];
        registInterface = [RegistInterface alloc];
        registInterface.delegate = self;
        [registInterface setView:view];
        [view release];
        [self performSelector:@selector(addRegistInterface)];
    }else{
        [registInterface.view setFrame:rect];
        [self performSelector:@selector(addRegistInterface)];
    }
}

- (void)addRegistInterface
{
    currentView = registInterface.view;
    [self.view addSubview:registInterface.view];
    [self easeIn:registInterface.view];
    NSLog(@"regist retain count %d", registInterface.retainCount);
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
    [self performSelector:@selector(addMap)];
    [self performSelector:@selector(showTabBar)];
    [self performSelector:@selector(initOtherTabsInterface)];
    
    [self easeOut:loginInterface.view];
}

- (void)addMap
{
    CGRect rect = CGRectMake(0, 0, 320, 460);
    UIView* view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    mapInterface = [MapInterface alloc];
    mapInterface.delegate = self;
    [mapInterface setView:view];
    currentView = loginInterface.view;
    [self.view addSubview:mapInterface.view];
}

- (void)showTabBar
{
    CGRect barRect = CGRectMake(0, 420, 320, 40);
    tabBar = [[UITabBar alloc] initWithFrame:barRect];
    tabBar.delegate = self;
    UITabBarItem* indexItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil tag:0];
    UITabBarItem* chatItem = [[UITabBarItem alloc] initWithTitle:@"聊天" image:nil tag:1];
    UITabBarItem* friendItem = [[UITabBarItem alloc] initWithTitle:@"好友" image:nil tag:2];
    UITabBarItem* systemSettingItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:nil tag:3];
    NSArray* arr = [[NSArray alloc] initWithObjects:indexItem, chatItem, friendItem, systemSettingItem, nil];
    [tabBar setItems:arr];
    tabBar.selectedItem = indexItem;
    [self.view addSubview:tabBar];
}

- (void)initOtherTabsInterface
{
    UIView* view = [[UIView alloc] initWithFrame:mapInterface.view.frame];
    view.backgroundColor = [UIColor redColor];
    chatInterface = [ChatInterface alloc];
    [chatInterface setView:view];
    [view release];
    
    UIView* view0 = [[UIView alloc] initWithFrame:mapInterface.view.frame];
    view0.backgroundColor = [UIColor blueColor];
    friendInterface = [FriendsInterface alloc];
    [friendInterface setView:view0];
    [view0 release];
    
    UIView* view1 = [[UIView alloc] initWithFrame:mapInterface.view.frame];
    view1.backgroundColor = [UIColor yellowColor];
    systemSettingInterface = [SystemSettingInterface alloc];
    [systemSettingInterface setView:view1];
    [view1 release];
}

#pragma mark - 进入聊天界面
- (void)showChatInterface:(NSInteger)tag
{
    CGRect rect = CGRectMake(0, 0, 320, 460);
    UIView* view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    chatInterface = [ChatInterface alloc];
    chatInterface.delegate = self;
    [chatInterface setView:view];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    UIView* obj = [self.view.subviews objectAtIndex:0];
    if(obj == nil) return;
    switch (item.tag) {
        case 0:             // 地图界面
            if([obj isEqual:mapInterface.view]){
                NSLog(@"is map interface");
                return;
            }
            [obj removeFromSuperview];
            [self.view insertSubview:mapInterface.view atIndex:0];
            break;
        case 1:             // 聊天界面
            if([obj isEqual:chatInterface.view]){
                NSLog(@"is chat interface");
                return;
            }
            [obj removeFromSuperview];
            NSLog(@"%@", chatInterface.view);
            [self.view insertSubview:chatInterface.view atIndex:0];
            break;
        case 2:             // 好友界面
            if([obj isEqual:friendInterface.view]){
                NSLog(@"is friend interface");
                return;
            }
            [obj removeFromSuperview];
            [self.view insertSubview:friendInterface.view atIndex:0];
            break;
        case 3:             // 设置界面
            if([obj isEqual:systemSettingInterface.view]){
                NSLog(@"is systemSetting interface");
                return;
            }
            [obj removeFromSuperview];
            [self.view insertSubview:systemSettingInterface.view atIndex:0];
            break;
        default:
            break;
    }
}

#pragma mark - 动画播放完成后移除相关界面
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CATransition* animation = (CATransition *)anim;
    if(animation){
        if([[animation type] isEqualToString:@"push"] && currentView != nil){
            NSLog(@"remove currentView from super view");
            [currentView removeFromSuperview];
            if([currentView isEqual:loginInterface.view]){
                if(loginInterface != nil) [loginInterface release];
                if(registInterface != nil) [registInterface release];
                if(othersInterface != nil) [othersInterface release];
            }
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
