//
//  ProfileInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/28/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "ProfileInterface.h"

@implementation ProfileInterface

@synthesize avatar;
@synthesize nicknameLabel;
@synthesize ageLabel;
@synthesize sexLabel;
@synthesize textButton;
@synthesize voiceButton;
@synthesize taskButton;
@synthesize mtIdLabel;
@synthesize userData;
@synthesize profileTable;
@synthesize actionButton;
@synthesize delegate;

- (void)dealloc
{
	NSLog(@"******| ProfileInterface |****** receive dealloc message!");
	[avatar release];
	[nicknameLabel release];
	[ageLabel release];
	[sexLabel release];
	[mtIdLabel release];
	[userData release];
	avatar = nil;
	nicknameLabel = nil;
	ageLabel = nil;
	sexLabel = nil;
	textButton = nil;
	voiceButton = nil;
	taskButton = nil;
	mtIdLabel = nil;
	userData = nil;
	actionButton = nil;
	[super dealloc];
}

- (UserData *)userData
{
	return userData;
}

- (void)userData:(UserData *)ud
{
	if(userData != ud){
		[userData release];
		userData = [ud retain];
	}
}

- (id)initWithUserData:(UserData *)data
{
	self = [super init];
	if(self){
		userData = [data retain];
		[self performSelector:@selector(initInterface)];
	}
	return self;
}

- (void)initInterface
{
	self.navigationItem.title = [NSString stringWithFormat:@"%@的资料", userData.nickname];
	avatar = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"72" ofType:@"png"]]];
	[avatar setFrame:CGRectMake(10, 10, 72, 72)];
	[avatar.image stretchableImageWithLeftCapWidth:10 topCapHeight:10];
	[self.view addSubview:avatar];
	
	nicknameLabel = [[UILabel alloc] initWithFrame:CGRectMake(92, 10, self.view.frame.size.width - 102, 30)];
	nicknameLabel.text = userData.nickname;
	[self.view addSubview:nicknameLabel];
	
	mtIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(92, 50, self.view.frame.size.width - 102, 30)];
	mtIdLabel.text = [NSString stringWithFormat:@"移族ID: %d", userData.uid];
	[self.view addSubview:mtIdLabel];
	
	EditableUITableCellData* cell0 = [[EditableUITableCellData alloc] init];
    [cell0 label: @"性别"];
	[cell0 placeholder: @"性别"];
    [cell0 value: userData.sex == 0 ? @"女" : @"男"];
	[cell0 cellType: kTextField];
    [cell0 width: 150];
    [cell0 height: 1000];
	
	EditableUITableCellData* cell1 = [[EditableUITableCellData alloc] init];
    [cell1 label: @"年龄"];
	[cell1 placeholder: @"年龄"];
    [cell1 value: [NSString stringWithFormat:@"%d", userData.age]];
	[cell1 cellType: kTextField];
    [cell1 width: 150];
    [cell1 height: 1000];
	
	NSArray* tempArr = [[NSArray alloc] initWithObjects:cell0, cell1, nil];
    NSArray* arrData = [[NSArray alloc] initWithObjects:tempArr, nil];
    EditableUITableViewData* tableViewData = [[EditableUITableViewData alloc] init];
    [tableViewData data: arrData];
	[cell0 release];
	[cell1 release];
	
	profileTable = [[EditableUITableView alloc] initWithFrame:CGRectMake(10, 90, self.view.frame.size.width - 20, self.view.frame.size.height - 200)];
    [profileTable data: tableViewData];
    [profileTable identifier: @"FirstSection"];
    [self.view addSubview:profileTable.view];
    
    [tableViewData release];
    [tempArr release];
    [arrData release];
	
	textButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[textButton setFrame:CGRectMake(10, profileTable.view.frame.size.height + profileTable.view.frame.origin.y + 10, 60, 30)];
	[textButton setTitle:@"文字" forState:UIControlStateNormal];
	textButton.tag = 0;
	[textButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:textButton];
	
	voiceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[voiceButton setFrame:CGRectMake(80, profileTable.view.frame.size.height + profileTable.view.frame.origin.y + 10, 60, 30)];
	[voiceButton setTitle:@"语音" forState:UIControlStateNormal];
	voiceButton.tag = 1;
	[voiceButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:voiceButton];
	
	taskButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[taskButton setFrame:CGRectMake(150, profileTable.view.frame.size.height + profileTable.view.frame.origin.y + 10, 60, 30)];
	[taskButton setTitle:@"任务" forState:UIControlStateNormal];
	taskButton.tag = 2;
	[taskButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:taskButton];
	
	actionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[actionButton setFrame:CGRectMake(220, profileTable.view.frame.size.height + profileTable.view.frame.origin.y + 10, 60, 30)];
	[actionButton setTitle:@"表情" forState:UIControlStateNormal];
	actionButton.tag = 3;
	[actionButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:actionButton];
}

- (void)buttonPressed:(id)sender
{
	UIView* view = (UIView *)sender;
	switch(view.tag){
		case 0:
			
			break;
		case 1:
			
			break;
		case 2:
			if(delegate && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]){
				[delegate showAbleTaskInterfaceWithUserData:userData];
			}
			break;
		case 3:
			if(delegate && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]){
				[delegate showEmotionListWithUserData:userData];
			}
			break;
		default:
			break;
	}
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
