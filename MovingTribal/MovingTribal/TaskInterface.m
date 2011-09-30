//
//  TaskInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TaskInterface.h"

@implementation TaskInterface

@synthesize delegate;
@synthesize tasks;
@synthesize tasksTable;
@synthesize userData;

- (void)dealloc
{
	NSLog(@"******| TaskInterface |****** receive dealloc message!");
	for(Task* item in tasks){
		[item release];
	}
	tasks = nil;
	[tasksTable release];
	tasksTable = nil;
	delegate = nil;
	[super dealloc];
}

- (id)initWithTasks:(NSArray *)arr userData:(UserData *)data
{
	self = [super init];
	if(self){
		userData = [data retain];
		tasks = [arr retain];
		[self performSelector:@selector(initInterface)];
	}
	return self;
}

- (void)initInterface
{
	self.navigationItem.title = @"可发起的任务";
	tasksTable = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
	[tasksTable.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	tasksTable.tableView.delegate = self;
	tasksTable.tableView.dataSource = self;
	[self.view addSubview:tasksTable.view];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(delegate && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]){
		[delegate showTaskDetailWithTaskData:[tasks objectAtIndex:indexPath.row] withUserData:userData];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString* str = @"TaskItem";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		[cell setEditing:NO animated:YES];
    }
	Task* task = (Task *)[tasks objectAtIndex:indexPath.row];
    cell.textLabel.text = task.taskName;
	NSString* desStr = task.taskDescription;
	if([desStr length] > 20){
		desStr = [NSString stringWithFormat:@"%@...", [desStr substringToIndex:10]];
	}
	cell.detailTextLabel.text = desStr;
    cell.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"16" ofType:@"png"]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [tasks count];
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
