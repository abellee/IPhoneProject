//
//  MovingTribalAppDelegate.m
//  MovingTribal
//
//  Created by Lee Abel on 9/11/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MovingTribalAppDelegate.h"

@implementation MovingTribalAppDelegate

@synthesize window = _window;
@synthesize movingTribal;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    CGRect rect = CGRectMake(0, 20, self.window.frame.size.width, self.window.frame.size.height - 20);
    self.movingTribal = [[MovingTribalController alloc] init];
    [self.movingTribal.view setFrame:rect];
    [self.window addSubview:self.movingTribal.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"did enter background");
    [[UIApplication sharedApplication] setKeepAliveTimeout:600 handler:^{NSLog(@"I'm alive!!!");}];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"application will terminate!");
	[[UIApplication sharedApplication] clearKeepAliveTimeout];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken
{
    NSLog(@"receive device token: %@", devToken);
#if !TARGET_IPHONE_SIMULATOR
    
	// Get Bundle Info for Remote Registration (handy if you have more than one app)
	NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
	NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
	
	// Check what Notifications the user has turned on.  We registered for all three, but they may have manually disabled some or all of them.
	NSUInteger rntypes = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
	
	// Set the defaults to disabled unless we find otherwise...
	NSString *pushBadge = (rntypes & UIRemoteNotificationTypeBadge) ? @"enabled" : @"disabled";
	NSString *pushAlert = (rntypes & UIRemoteNotificationTypeAlert) ? @"enabled" : @"disabled";
	NSString *pushSound = (rntypes & UIRemoteNotificationTypeSound) ? @"enabled" : @"disabled";	
	
	// Get the users Device Model, Display Name, Unique ID, Token & Version Number
	UIDevice *dev = [UIDevice currentDevice];
	NSString *deviceUuid;
	if ([dev respondsToSelector:@selector(uniqueIdentifier)])
		deviceUuid = dev.uniqueIdentifier;
	else {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		id uuid = [defaults objectForKey:@"deviceUuid"];
		if (uuid)
			deviceUuid = (NSString *)uuid;
		else {
			CFStringRef cfUuid = CFUUIDCreateString(NULL, CFUUIDCreate(NULL));
			deviceUuid = (NSString *)cfUuid;
			CFRelease(cfUuid);
			[defaults setObject:deviceUuid forKey:@"deviceUuid"];
		}
	}
	NSString *deviceName = [dev.name stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
	NSString *deviceModel = [dev.model stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
	NSString *deviceSystemVersion = dev.systemVersion;
	
	// Prepare the Device Token for Registration (remove spaces and < >)
	NSString *deviceToken = [[[[devToken description] 
                               stringByReplacingOccurrencesOfString:@"<"withString:@""] 
                              stringByReplacingOccurrencesOfString:@">" withString:@""] 
                             stringByReplacingOccurrencesOfString: @" " withString: @""];
	
	// Build URL String for Registration
	// !!! CHANGE "www.mywebsite.com" TO YOUR WEBSITE. Leave out the http://
	// !!! SAMPLE: "secure.awesomeapp.com"
	
	
	// !!! CHANGE "/apns.php?" TO THE PATH TO WHERE apns.php IS INSTALLED 
	// !!! ( MUST START WITH / AND END WITH ? ). 
	// !!! SAMPLE: "/path/to/apns.php?"
	NSString *urlString = [NSString stringWithFormat:@"/apns.php?task=%@&appname=%@&appversion=%@&deviceuid=%@&devicetoken=%@&devicename=%@&devicemodel=%@&deviceversion=%@&pushbadge=%@&pushalert=%@&pushsound=%@", @"register", appName,appVersion, deviceUuid, deviceToken, deviceName, deviceModel, deviceSystemVersion, pushBadge, pushAlert, pushSound];
	
	// Register the Device Data
	// !!! CHANGE "http" TO "https" IF YOU ARE USING HTTPS PROTOCOL
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:[Globals root] path:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//	NSLog(@"Register URL: %@", url);
//	NSLog(@"Return Data: %@", returnData);
    [url release];
    [request release];
	
#endif
}

/**
 * 正式版需要调整为:
 * 服务端只发送聊天信息发送者的uid，客户端进行检测本地缓存中是否存在该用户的数据，否则请示服务器取得用户数据;
 * 并通过uid向服务端请示未读消息列表
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
	NSLog(@"%@", [userInfo description]);
    NSDictionary* apsDic = [userInfo objectForKey:@"aps"];
	if(apsDic){
		int type = [[userInfo objectForKey:@"type"] intValue];
		if(type == -1){
			NSString* alertStr = [apsDic objectForKey:@"alert"];
			UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:alertStr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
			[alert show];
			[alert release];
			[[Globals getMainSystem] playSystemSound:DefaultSound];
			return;
		}
		NSString* str = [userInfo objectForKey:@"text"];
		NSDate* time = [NSDate dateWithTimeIntervalSince1970:[[userInfo objectForKey:@"time"] intValue]];
		UserData* userData = [[UserData alloc] init];
		userData.uid = [[userInfo objectForKey:@"uid"] intValue];
		userData.nickname = [userInfo objectForKey:@"nickname"];
		NSLog(@"%d", type);
		if(type == TextMessage){
			MessageInfo* messageInfo = [[MessageInfo alloc] init];
			messageInfo.type = type;
			messageInfo.text = str;
			messageInfo.time = time;
			messageInfo.from = userData;
			[[Globals getMessageCenter] insertUnreadMessage:messageInfo userData:userData];
			[[NSNotificationCenter defaultCenter] postNotificationName:NEW_MESSAGE object:messageInfo];
			[messageInfo release];
		}else if(type == TaskMessage){
			TaskMessageInfo* taskMessageInfo = [[TaskMessageInfo alloc] init];
			taskMessageInfo.type = type;
			taskMessageInfo.text = str;
			taskMessageInfo.time = time;
			taskMessageInfo.from = userData;
			int taskId = [[userInfo objectForKey:@"taskId"] intValue];
			taskMessageInfo.taskId = taskId;
			int aid = userData.uid;
			
			Task* task;
			if(taskMessageInfo.taskId == 1){
				task = [[Task alloc] init];
				task.taskId = 1;
				task.taskName = @"初识好友";
				task.taskDescription = [NSString stringWithFormat:@"请入移族世界的第一件事件，就是去结交新朋友喔\ue056，那就赶快行动吧！\ue409", userData.nickname];
				task.taskPublisher = @"移族";
				task.taskPublishTime = 13000000;
				task.taskExpireTime = 135453434;
				task.taskAward = @"增加50移族积分";
				task.authorId = aid;
			}else{
				task = [[Task alloc] init];
				task.taskId = 2;
				task.taskName = @"摇一摇";
				task.taskDescription = [NSString stringWithFormat:@"摇一摇你的手机，跟%@打声招呼吧～\ue011", userData.nickname];
				task.taskPublisher = @"移族";
				task.taskPublishTime = 13000000;
				task.taskExpireTime = 135453434;
				task.taskAward = @"增加50移族积分";
				task.authorId = aid;
			}
			
			taskMessageInfo.taskData = task;
			[task release];
			
			[[Globals getMessageCenter] insertUnreadMessage:taskMessageInfo userData:userData];
			[[NSNotificationCenter defaultCenter] postNotificationName:NEW_MESSAGE object:taskMessageInfo];
			[taskMessageInfo release];
		}
		[userData release];
	}
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"%@", error.description);
}

@end
