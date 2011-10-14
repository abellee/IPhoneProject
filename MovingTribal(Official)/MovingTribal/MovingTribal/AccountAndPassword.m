//
//  AccountAndPassword.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "AccountAndPassword.h"

@implementation AccountAndPassword

@synthesize delegate;

- (void)dealloc
{
	NSLog(@"******| AccountAndPassword |****** received dealloc message!");
	[tableViewController release];
	tableViewController = nil;
	[super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super init];
	if(self){
		[self.view setFrame:frame];
		self.view.backgroundColor = [UIColor whiteColor];
		[self performSelector:@selector(initInterface)];
	}
	return self;
}

- (void)initInterface
{
	self.navigationItem.title = @"注册移族";
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backward:)];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(forward:)];
	
	EditableUITableViewCellData *usernameCellData = [[EditableUITableViewCellData alloc] init];
	usernameCellData.placeholder = @"example@mail.com";
	usernameCellData.label = @"邮箱地址";
	usernameCellData.value = @"";
	usernameCellData.cellType = kTextField;
	usernameCellData.keyboardType = UIKeyboardTypeDefault;
	usernameCellData.keyboardAppearance = UIKeyboardAppearanceDefault;
	usernameCellData.returnKeyType = UIReturnKeyNext;
	usernameCellData.width = 200;
	usernameCellData.height = 50;
	
	EditableUITableViewCellData *passwordCellData = [[EditableUITableViewCellData alloc] init];
	passwordCellData.placeholder = @"不少于6位";
	passwordCellData.label = @"密码";
	passwordCellData.value = @"";
	passwordCellData.cellType = kTextField;
	passwordCellData.keyboardType = UIKeyboardTypeDefault;
	passwordCellData.keyboardAppearance = UIKeyboardAppearanceDefault;
	passwordCellData.returnKeyType = UIReturnKeyNext;
	passwordCellData.secureTextEntry = YES;
	passwordCellData.width = 200;
	passwordCellData.height = 50;
	
	EditableUITableViewCellData *repasswordCellData = [[EditableUITableViewCellData alloc] init];
	repasswordCellData.placeholder = @"再次确认密码";
	repasswordCellData.label = @"确认密码";
	repasswordCellData.value = @"";
	repasswordCellData.cellType = kTextField;
	repasswordCellData.keyboardType = UIKeyboardTypeDefault;
	repasswordCellData.keyboardAppearance = UIKeyboardAppearanceDefault;
	repasswordCellData.returnKeyType = UIReturnKeyDone;
	repasswordCellData.secureTextEntry = YES;
	repasswordCellData.width = 200;
	repasswordCellData.height = 50;
	
	NSArray *sectionArray = [NSArray arrayWithObjects:usernameCellData, passwordCellData, repasswordCellData, nil];
	NSDictionary *sectionDict = [NSDictionary dictionaryWithObjectsAndKeys:@"", kSectionTitle, sectionArray, kSectionData, nil];
	NSArray * arr = [NSArray arrayWithObject:sectionDict];
	
	EditableUITableViewData *viewData = [[EditableUITableViewData alloc] init];
	viewData.data = arr;
	
	tableViewController = [[EditableUITableViewController alloc] initTableViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) scrollEnabled:NO];
	tableViewController.data = viewData;
	[self.view addSubview:tableViewController.view];
	
	[usernameCellData release];
	[passwordCellData release];
	[repasswordCellData release];
	[viewData release];
	usernameCellData = nil;
	passwordCellData = nil;
	repasswordCellData = nil;
	viewData = nil;
	sectionArray = nil;
	sectionDict = nil;
	arr = nil;
	
	NSLog(@"%@", [tableViewController.data description]);
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
