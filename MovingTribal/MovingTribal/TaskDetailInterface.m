//
//  TaskDetailInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TaskDetailInterface.h"
#import "NetWork.h"

@implementation TaskDetailInterface

@synthesize delegate;
@synthesize userData;
@synthesize taskIcon;
@synthesize taskName;
@synthesize taskAward;
@synthesize taskLimitTime;
@synthesize taskPublisher;
@synthesize taskDescription;
@synthesize taskRequirement;
@synthesize taskData;
@synthesize taskTable;
@synthesize runButton;
@synthesize sectionNames;
@synthesize left;
@synthesize right;

- (id)initWithTaskData:(Task *)task userData:(UserData *)data
{
	self = [super init];
	if(self){
		left = NO;
		right = NO;
		userData = [data retain];
		taskData = [task retain];
		[self performSelector:@selector(initInterface)];
	}
	return self;
}

- (void)dealloc
{
	NSLog(@"******| TaskDetailInterface |****** receive dealloc message!");
	[super dealloc];
}

- (void)initInterface
{
	self.navigationItem.title = @"任务说明";
	sectionNames = [[NSArray arrayWithObjects:@"任务介绍", @"任务奖励", nil] retain];
	taskIcon = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"72" ofType:@"png"]]];
	[taskIcon setFrame:CGRectMake(10, 10, 72, 72)];
	[self.view addSubview:taskIcon];
	
	runButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[runButton setTitle:@"发起" forState:UIControlStateNormal];
	[runButton setFrame:CGRectMake(10, 92, 72, 30)];
	[self.view addSubview:runButton];
	[runButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	
	taskName = [[UILabel alloc] initWithFrame:CGRectMake(92, 10, self.view.frame.size.width - 102, 30)];
	taskName.text = taskData.taskName;
	[self.view addSubview:taskName];
	
	taskPublisher = [[UILabel alloc] initWithFrame:CGRectMake(92, 40, self.view.frame.size.width - 102, 30)];
	taskPublisher.text = [NSString stringWithFormat:@"发布者:%@", taskData.taskPublisher];
	[self.view addSubview:taskPublisher];
	
	taskLimitTime = [[UILabel alloc] initWithFrame:CGRectMake(92, 80, self.view.frame.size.width - 102, 30)];
	NSString* str = [NSString stringWithFormat:@"%d - %d", taskData.taskPublishTime, taskData.taskExpireTime];
	if(taskData.completion) str = @"已完成";
	taskLimitTime.text = str;
	[self.view addSubview:taskLimitTime];
	
	taskTable = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	[taskTable.view setFrame:CGRectMake(0,  140,  self.view.frame.size.width,  self.view.frame.size.height - 140)];
    taskTable.tableView.delegate = self;
    taskTable.tableView.dataSource = self;
    [self.view addSubview:taskTable.view];
}

- (void)buttonPressed:(id)sender
{
	if(taskData.taskId == 2){
		UIAlertView* alerta = [[UIAlertView alloc] initWithTitle:nil message:@"请[确定]后左右摇动您的手机!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
		[alerta show];
		[alerta autorelease];
		return;
	}
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:@"任务邀请已发送，请等待对方确认!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
	[alert show];
	[alert release];
	[NetWork inviteWithTask:taskData userData:userData];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(buttonIndex == alertView.cancelButtonIndex){
		UIAccelerometer* accelerator = [UIAccelerometer sharedAccelerometer];
		accelerator.delegate = self;
		accelerator.updateInterval = 1 / 60;
	}
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
	NSLog(@"%f", acceleration.x);
	if(acceleration.x > 1.2){
		left = YES;
	}
	if(acceleration.x < -1.2){
		right = YES;
	}
	if(left == YES && right == YES){
		accelerometer.delegate = nil;
		UIAlertView* alerta = [[UIAlertView alloc] initWithTitle:nil message:@"任务邀请已发送，请等待对方确认!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
		[alerta show];
		[alerta release];
		left = NO;
		right = NO;
		[NetWork inviteWithTask:taskData userData:userData];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* str = @"TaskItem";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
//		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//		[cell setEditing:NO animated:YES];
    }
    switch (indexPath.row) {
		case 0:
			cell.textLabel.text = taskData.taskDescription;
			break;
		case 1:
			cell.textLabel.text = taskData.taskAward;
			break;
		default:
			break;
	}
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return  [sectionNames count];
}

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
