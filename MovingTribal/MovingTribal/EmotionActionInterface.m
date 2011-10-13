//
//  EmotionActionInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "EmotionActionInterface.h"
#import "EmotionAction.h"

@implementation EmotionActionInterface

@synthesize userData;
@synthesize emotionsList;
@synthesize emotionsData;
@synthesize delegate;

- (void)dealloc
{
	NSLog(@"******| EmotionActionInterface |****** receive dealloc message!");
	[userData release];
	[emotionsList release];
	for (EmotionAction* item in emotionsData) {
		[item release];
	}
	emotionsData = nil;
	userData = nil;
	emotionsList = nil;
	delegate = nil;
	
	[super dealloc];
}

- (id)initWithUserData:(UserData *)data
{
	self = [super self];
	if(self){
		userData = [data retain];
		[self performSelector:@selector(initInterface)];
	}
	return self;
}

- (void)initInterface
{
	self.navigationItem.title = @"动作表情";
	EmotionAction* emo0 = [[EmotionAction alloc] init];
	emo0.emotionId = 1;
	emo0.emotionName = @"凌空瞪";
	emo0.emotionDescription = [NSString stringWithFormat:@"你凌空一瞪%@, 吓屎了TA身后两头牛!", userData.nickname];
	
	EmotionAction* emo1 = [[EmotionAction alloc] init];
	emo1.emotionId = 2;
	emo1.emotionName = @"闷头一棍";
	emo1.emotionDescription = [NSString stringWithFormat:@"你朝%@闷头一棍，指着TA的鼻子说:\"让你不理我!\"", userData.nickname];
	
	emotionsData = [[NSArray arrayWithObjects:emo0, emo1, nil] retain];
	
	emotionsList = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
	[emotionsList.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	emotionsList.tableView.delegate = self;
	emotionsList.tableView.dataSource = self;
	[self.view addSubview:emotionsList.view];
	
	[emo0 release];
	[emo1 release];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UIAlertView* alerta = [[UIAlertView alloc] initWithTitle:nil message:@"动作表情发送成功!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
	[alerta show];
	[alerta autorelease];
	[[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
	[NetWork sendActionEmotion:[emotionsData objectAtIndex:indexPath.row] userData:userData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* str = @"EmotionItem";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
//		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//		[cell setEditing:NO animated:YES];
    }
	EmotionAction* emo = [emotionsData objectAtIndex:indexPath.row];
    cell.textLabel.text = emo.emotionName;
	cell.detailTextLabel.text = emo.emotionDescription;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return  [emotionsData count];
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
