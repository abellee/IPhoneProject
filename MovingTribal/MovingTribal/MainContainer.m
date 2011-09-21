//
//  MainContainer.m
//  MovingTribal
//
//  Created by Lee Abel on 9/17/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MainContainer.h"

@implementation MainContainer

@synthesize mapInterface;
@synthesize chatListInterface;
@synthesize friendInterface;
@synthesize systemSettingInterface;
@synthesize tabBar;

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"******| Main Container |****** receive dealloc message!");
    if(mapInterface != nil) [mapInterface release];
    if(chatListInterface != nil) [chatListInterface release];
    if(friendInterface != nil) [friendInterface release];
    if(systemSettingInterface != nil) [systemSettingInterface release];
    if(tabBar != nil) [tabBar release];
    delegate = nil;
    [super dealloc];
}

- (void)setView:(UIView *)view
{
    [super setView:view];
    [self performSelector:@selector(showMapInterface)];
    [self performSelector:@selector(showTabBar)];
}

#pragma 显示地图界面
- (void)showMapInterface
{
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    if(mapInterface == nil){
        mapInterface = [[MapInterface alloc] init];
        mapInterface.delegate = self;
        mapInterface.view.backgroundColor = [UIColor whiteColor];
    }
    [mapInterface initInterface];
    [mapInterface.view setFrame:rect];
    [self.view insertSubview:mapInterface.view atIndex:0];
}

#pragma 退出地图界面
- (void)exitMapInterface
{
    if(mapInterface != nil) [mapInterface.view removeFromSuperview];
}

#pragma 显示聊天列表界面
- (void)showChatListInterface
{
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    if(chatListInterface == nil){
        chatListInterface = [[SearchableListInterface alloc] init];
        chatListInterface.delegate = self;
    }
    [chatListInterface.view setFrame:rect];
    [self.view insertSubview:chatListInterface.view atIndex:0];
}

#pragma 退出聊天列表界面
- (void)exitChatListInterface
{
    if(chatListInterface != nil) [chatListInterface.view removeFromSuperview];
}

#pragma 显示好友列表界面
- (void)showFriendListInterface
{
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    if(friendInterface == nil){
        friendInterface = [[SearchableListInterface alloc] init];
        friendInterface.delegate = self;
    }
    [friendInterface.view setFrame:rect];
    [self.view insertSubview:friendInterface.view atIndex:0];
}

#pragma 退出好友列表界面
- (void)exitFriendListInterface
{
    if(friendInterface != nil) [friendInterface.view removeFromSuperview];
}

#pragma 显示系统设置界面
- (void)showSystemSettingInterface
{
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    if(systemSettingInterface == nil){
        systemSettingInterface = [[SystemSettingInterface alloc] init];
        systemSettingInterface.delegate = self;
        systemSettingInterface.view.backgroundColor = [UIColor whiteColor];
    }
    [systemSettingInterface.view setFrame:rect];
    [self.view insertSubview:systemSettingInterface.view atIndex:0];
}

#pragma 退出系统设置界面
- (void)exitSystemSettingInterface
{
    if(systemSettingInterface != nil) [systemSettingInterface.view removeFromSuperview];
}

#pragma 显示TabBar
- (void)showTabBar
{
    CGRect barRect = CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 40);
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
    
    [arr release];
    [indexItem release];
    [chatItem release];
    [friendItem release];
    [systemSettingItem release];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    UIView* view = [self.view.subviews objectAtIndex:0];
    if(view == nil) return;
    switch (item.tag) {
        case 0:             // 地图界面
            if([view isEqual:mapInterface.view]){
                NSLog(@"is map interface");
                return;
            }
            [self performSelector:@selector(showMapInterface)];
            break;
        case 1:             // 聊天界面
            if([view isEqual:chatListInterface.view]){
                NSLog(@"is chatList interface");
                return;
            }
            [self performSelector:@selector(showChatListInterface)];
            break;
        case 2:             // 好友界面
            if([view isEqual:friendInterface.view]){
                NSLog(@"is friend interface");
                return;
            }
            [self performSelector:@selector(showFriendListInterface)];
            break;
        case 3:             // 设置界面
            if([view isEqual:systemSettingInterface.view]){
                NSLog(@"is systemSetting interface");
                return;
            }
            [self performSelector:@selector(showSystemSettingInterface)];
            break;
        default:
            break;
    }
    [self performSelector:@selector(removeAndDealloc:) withObject:view];
}

- (void)removeAndDealloc:(UIView *)view
{
    if(view == mapInterface.view){
        [mapInterface.view removeFromSuperview];
//        [mapInterface release];
//        mapInterface = nil;
    }else if(view == chatListInterface.view){
        [chatListInterface.view removeFromSuperview];
        [chatListInterface release];
        chatListInterface = nil;
    }else if(view == friendInterface.view){
        [friendInterface.view removeFromSuperview];
        [friendInterface release];
        friendInterface = nil;
    }else if(view == systemSettingInterface.view){
        [systemSettingInterface.view removeFromSuperview];
        [systemSettingInterface release];
        systemSettingInterface = nil;
    }
}

- (void)showChatInterface:(UserData *)userData
{
    if(delegate != nil  && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]) [delegate showChatInterface:userData];
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
