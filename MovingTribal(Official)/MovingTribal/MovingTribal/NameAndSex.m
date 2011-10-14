//
//  NameAndSex.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "NameAndSex.h"

@implementation NameAndSex

@synthesize delegate;

- (void)dealloc
{
	NSLog(@"******| AvatarSetting |****** received dealloc message!");
	[sexSegmented removeTarget:self action:@selector(selectSex:) forControlEvents:UIControlEventValueChanged];
	[sexSegmented release];
	sexSegmented = nil;
	[tableViewController release];
	tableViewController = nil;
	[super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super init];
	if(self){
		sex = -1;
		[self.view setFrame:frame];
		self.view.backgroundColor = [UIColor whiteColor];
		[self performSelector:@selector(initInterface)];
	}
	return self;
}

- (void)initInterface
{
	self.navigationItem.title = @"注册移族";
	self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backward:)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(forward:)];
	
	EditableUITableViewCellData *usernameCellData = [[EditableUITableViewCellData alloc] init];
	usernameCellData.placeholder = @"请输入您的姓名";
	usernameCellData.label = @"姓名";
	usernameCellData.value = @"";
	usernameCellData.cellType = kTextField;
	usernameCellData.keyboardType = UIKeyboardTypeDefault;
	usernameCellData.keyboardAppearance = UIKeyboardAppearanceDefault;
	usernameCellData.returnKeyType = UIReturnKeyDone;
	usernameCellData.width = 200;
	usernameCellData.height = 50;
	
	UIFont *fontStyle = [[UIFont alloc] fontWithSize:12.0];
	UILabel *noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [[Config instance] size].width, 30)];
	noticeLabel.text = @"使用真实姓名更方便其它人查找并联系您";
	noticeLabel.textAlignment = UITextAlignmentCenter;
	noticeLabel.font = fontStyle;
	noticeLabel.backgroundColor = [UIColor clearColor];
	
	NSArray *sectionArray = [NSArray arrayWithObjects:usernameCellData, nil];
	NSDictionary *sectionDict = [NSDictionary dictionaryWithObjectsAndKeys:@"", kSectionTitle, sectionArray, kSectionData, noticeLabel, kSectionFooterView, nil];
	NSArray * arr = [NSArray arrayWithObject:sectionDict];
	
	EditableUITableViewData *viewData = [[EditableUITableViewData alloc] init];
	viewData.data = arr;
	
	tableViewController = [[EditableUITableViewController alloc] initTableViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 140) scrollEnabled:NO];
	tableViewController.data = viewData;
	[self.view addSubview:tableViewController.view];
	
	sexSegmented = [[UISegmentedControl alloc] initWithFrame:CGRectMake(20, 90, 280, 30)];
	[sexSegmented insertSegmentWithTitle:@"男" atIndex:0 animated:NO];
	[sexSegmented insertSegmentWithTitle:@"女" atIndex:1 animated:NO];
	[sexSegmented addTarget:self action:@selector(selectSex:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:sexSegmented];
	
	[usernameCellData release];
	[viewData release];
	[fontStyle release];
	[noticeLabel release];
	fontStyle = nil;
	noticeLabel = nil;
	usernameCellData = nil;
	viewData = nil;
	sectionArray = nil;
	sectionDict = nil;
	arr = nil;
	
	NSLog(@"%@", [tableViewController.data description]);
}

- (void)selectSex:(id)sender
{
	if(sex == -1){
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"注册成功后，性别将无法再次修改！" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
		[alertView show];
		[alertView release];
	}
	sex = [sexSegmented selectedSegmentIndex];
}

- (void)backward:(id)sender
{
	if(delegate && [delegate conformsToProtocol:@protocol(RegistInterfaceDelegate)])
		[delegate backwardForInterface:self];
}

- (void)forward:(id)sender
{
	if(delegate && [delegate conformsToProtocol:@protocol(RegistInterfaceDelegate)])
		[delegate forwardForInterface:self];
}

/*----------------------------------------------------------------------------*/

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
