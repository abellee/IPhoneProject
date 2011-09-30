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
	PROFILE_STATE,
	UNCOMPLETE_TASK_STATE,
	COMPLETE_TASK_STATE
}InterfaceState;

@implementation MovingTribalController

@synthesize introContainer;
@synthesize loginContainer;
@synthesize mainContainer;
@synthesize chatInterface;
@synthesize dataGetter;
@synthesize currentState;
@synthesize navigationController;
@synthesize profileInterface;
@synthesize taskInterface;
@synthesize taskDetailInterface;
@synthesize emotionActionInterface;

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
    CGRect mainContainerRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44);
    mainContainer = [[MainContainer alloc] init];
    mainContainer.delegate = self;
    [mainContainer.view setFrame:mainContainerRect];
	
	navigationController = [[UINavigationController alloc] initWithRootViewController:mainContainer];
	[navigationController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	navigationController.navigationBar.barStyle = UIBarStyleBlack;
	navigationController.navigationBar.topItem.title = @"地	图";
	UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithTitle:@"过滤显示" style:UIBarButtonItemStyleBordered target:self action:nil];
	navigationController.navigationBar.topItem.rightBarButtonItem = rightButton;
	[rightButton release];
	[self.view insertSubview:navigationController.view atIndex:0];
    
    [self performSelector:@selector(initDataGetter)];
    
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

- (void)initDataGetter
{
    if(dataGetter == nil){
        dataGetter = [[DataGetter alloc] init];
        [dataGetter initTimer];
    }
}

#pragma 显示目标玩家资料界面
- (void)showProfileInterface:(UserData *)userData
{
	if(profileInterface == nil){
		profileInterface = [[ProfileInterface alloc] initWithUserData:userData];
		profileInterface.view.backgroundColor = [UIColor grayColor];
		[profileInterface.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 40)];
		profileInterface.delegate = self;
		[navigationController pushViewController:profileInterface animated:YES];
		[profileInterface release];
		profileInterface = nil;
	}
}

#pragma 显示可做的任务列表
- (void)showAbleTaskInterfaceWithUserData:(UserData *)userData
{
	if(taskInterface == nil){
		Task* task0 = [[Task alloc] init];
		task0.taskId = 1;
		task0.taskName = @"初识好友";
		task0.taskDescription = [NSString stringWithFormat:@"请入移族世界的第一件事件，就是去结交新朋友喔\ue056，那就赶快行动吧！\ue409\n点击[发起任务]就可以向%@问声好啦～", userData.nickname];
		task0.taskPublisher = @"移族";
		task0.taskPublishTime = 13000000;
		task0.taskExpireTime = 135453434;
		task0.taskAward = @"增加50移族积分";
		
		Task* task1 = [[Task alloc] init];
		task1.taskId = 2;
		task1.taskName = @"摇一摇";
		task1.taskDescription = [NSString stringWithFormat:@"摇一摇你的手机，跟%@打声招呼吧～\ue011", userData.nickname];
		task1.taskPublisher = @"移族";
		task1.taskPublishTime = 13000000;
		task1.taskExpireTime = 135453434;
		task1.taskAward = @"增加50移族积分";

		NSArray* arr = [NSArray arrayWithObjects:task0, task1, nil];
		taskInterface = [[TaskInterface alloc] initWithTasks:arr userData:userData];
		taskInterface.view.backgroundColor = [UIColor whiteColor];
		[taskInterface.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 40)];
		taskInterface.delegate = self;
		[navigationController pushViewController:taskInterface animated:YES];
		[taskInterface release];
		taskInterface = nil;
		
		[task0 release];
		[task1 release];
	}
}

#pragma 显示任务详细说明界面
- (void)showTaskDetailWithTaskData:(Task *)taskData withUserData:(UserData *)userData
{
	if(taskDetailInterface == nil){
		taskDetailInterface = [[TaskDetailInterface alloc] initWithTaskData:taskData userData:userData];
		taskDetailInterface.view.backgroundColor = [UIColor whiteColor];
		[taskDetailInterface.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 40)];
		taskDetailInterface.delegate = self;
		[navigationController pushViewController:taskDetailInterface animated:YES];
		[taskDetailInterface release];
		taskDetailInterface = nil;
	}
}

#pragma 显示表情运作列表
- (void)showEmotionListWithUserData:(UserData *)userData
{
	if(emotionActionInterface == nil){
		emotionActionInterface = [[EmotionActionInterface alloc] initWithUserData:userData];
		emotionActionInterface.view.backgroundColor = [UIColor whiteColor];
		[emotionActionInterface.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 40)];
		emotionActionInterface.delegate = self;
		[navigationController pushViewController:emotionActionInterface animated:YES];
		[emotionActionInterface release];
		emotionActionInterface = nil;
	}
}

#pragma 显示与指定好友之间的聊天界面
- (void)showChatInterface:(UserData *)userData
{
    if(chatInterface == nil){
        chatInterface = [[ChatInterface alloc] initWithUserData:userData frame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 40)];
        chatInterface.view.backgroundColor = [UIColor whiteColor];
        chatInterface.delegate = self;
		[navigationController pushViewController:chatInterface animated:YES];
		[chatInterface release];
		chatInterface = nil;
    }
//    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    [chatInterface.view setFrame:rect];
//    [self.view addSubview:chatInterface.view];
//    TransitionVariable* transitionVar0 = [[TransitionVariable alloc] init];
//    [transitionVar0 subType: kCATransitionFromRight];
//    [transitionVar0 duration: 0.3];
//    [transitionVar0 view:chatInterface.view];
//    [self performSelector:@selector(easeIn:) withObject:transitionVar0];
//    [transitionVar0 release];
//    
//    CGRect outRect = CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
//    [mainContainer.view setFrame:outRect];
//    currentState = MAIN_STATE;
//    TransitionVariable* transitionVar = [[TransitionVariable alloc] init];
//    [transitionVar subType: kCATransitionFromRight];
//    [transitionVar duration: 0.5];
//    [transitionVar view:mainContainer.view];
//    [self performSelector:@selector(easeOut:) withObject:transitionVar];
//    [transitionVar release];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
	NSLog(@"will show");
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
	NSLog(@"finish!");
}

- (void)changeTitle:(NSInteger)tag
{
	UIBarButtonItem* rightButton;
	switch (tag) {
		case 0:
			navigationController.navigationBar.topItem.title = @"地	图";
			rightButton = [[UIBarButtonItem alloc] initWithTitle:@"过滤显示" style:UIBarButtonItemStyleBordered target:self action:nil];
			navigationController.navigationBar.topItem.rightBarButtonItem = rightButton;
			navigationController.navigationBar.topItem.leftBarButtonItem = nil;
			[rightButton release];
			break;
		case 1:
			navigationController.navigationBar.topItem.title = @"会	话";
			rightButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered target:mainContainer action:@selector(editCell)];
			navigationController.navigationBar.topItem.leftBarButtonItem = rightButton;
			navigationController.navigationBar.topItem.rightBarButtonItem = nil;
			[rightButton release];
			break;
		case 2:
			navigationController.navigationBar.topItem.title = @"好	友";
			rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
			UIBarButtonItem* leftButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered target:mainContainer action:@selector(editCell)];
			navigationController.navigationBar.topItem.rightBarButtonItem = rightButton;
			navigationController.navigationBar.topItem.leftBarButtonItem = leftButton;
			[rightButton release];
			[leftButton release];
			break;
		case 3:
			navigationController.navigationBar.topItem.title = @"系统设置";
			navigationController.navigationBar.topItem.leftBarButtonItem = nil;
			navigationController.navigationBar.topItem.rightBarButtonItem = nil;
			break;
		default:
			break;
	}
}

#pragma 退出与指定好友之间的聊天界面
- (void)exitChatInterface
{
    CGRect outRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [mainContainer.view setFrame:outRect];
    TransitionVariable* transitionVar = [[TransitionVariable alloc] init];
    [transitionVar subType: kCATransitionFromLeft];
    [transitionVar duration: 0.4];
    [transitionVar view:mainContainer.view];
    [self performSelector:@selector(easeIn:) withObject:transitionVar];
    [transitionVar release];
    
    CGRect rect = CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    [chatInterface.view setFrame:rect];
    currentState = CHAT_STATE;
    [self.view addSubview:chatInterface.view];
    TransitionVariable* transitionVar0 = [[TransitionVariable alloc] init];
    [transitionVar0 subType: kCATransitionFromLeft];
    [transitionVar0 duration: 0.4];
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
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
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
