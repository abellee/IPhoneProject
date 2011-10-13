//
//  TaskEntry.m
//  MovingTribal
//
//  Created by Lee Abel on 10/1/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TaskEntry.h"

@implementation TaskEntry

@synthesize task;
@synthesize userData;
@synthesize background;
@synthesize taskButton;
@synthesize avatar;
@synthesize entrySize;
@synthesize label;
@synthesize belong;
@synthesize delegate;

- (id)initWithCustomBackground:(UIView *)view taskData:(Task *)taskData userData:(UserData *)ud constrainedSize:(CGRect)rect
{
	self = [super init];
	if(self){
		background = [view retain];
		task = [taskData retain];
		userData = [ud retain];
		
		CGSize size = [task.taskDescription sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:rect.size lineBreakMode:UILineBreakModeWordWrap];
		avatar = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"32" ofType:@"png"]]];
		CGFloat avatarPosX = 0;
		CGFloat contentPosX = 0;
		if(userData.uid == [Globals getUserData].uid){        // self
			belong = Self;
			avatarPosX = size.width + 20;
		}else{                                            // others
			belong = Others;
			contentPosX = 42;                             // 头像暂定为32 + 10
		}
		
		[avatar setFrame:CGRectMake(avatarPosX, 0, avatar.frame.size.width, avatar.frame.size.height)];
		[self.view addSubview:avatar];
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(5 + contentPosX, 5, size.width, size.height)];
		label.text = task.taskDescription;
		label.font = [UIFont systemFontOfSize:17];
		label.numberOfLines = 0;
		label.lineBreakMode = UILineBreakModeWordWrap;
		[self.view addSubview:label];
		
		taskButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[taskButton setFrame:CGRectMake(contentPosX + (size.width + 10 - 80) / 2, label.frame.origin.y + label.frame.size.height + 5, 80, 30)];
		[taskButton setTitle:task.taskName forState:UIControlStateNormal];
		[taskButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:taskButton];
		
		[background setFrame:CGRectMake(contentPosX, 0, size.width + 10, taskButton.frame.origin.y + taskButton.frame.size.height + 5)];
		[self.view insertSubview:background atIndex:0];
		
		entrySize = CGSizeMake(background.frame.size.width + avatar.frame.size.width + 10, background.frame.size.height);
	}
	return self;
}

- (void)buttonPressed:(id)sender
{
	if(delegate && [delegate conformsToProtocol:@protocol(TaskEntryDelegate)]){
		[delegate showTaskDetailByTask:task ud:userData];
	}
}

- (void)dealloc
{
	NSLog(@"******| TaskEntry |****** receive dealloc message!");
	[task release];
	[userData release];
	[background release];
	[avatar release];
	[label release];
	task = nil;
	userData = nil;
	background = nil;
	taskButton = nil;
	avatar = nil;
	label = nil;
	delegate = nil;
	[super dealloc];
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
