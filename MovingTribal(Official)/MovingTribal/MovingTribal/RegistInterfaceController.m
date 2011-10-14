//
//  RegistInterfaceController.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "RegistInterfaceController.h"

@implementation RegistInterfaceController

- (id)init
{
	self = [super init];
	if(self){
		[self performSelector:@selector(initInterface)];
	}
	return self;
}

- (void)dealloc
{
	NSLog(@"******| RegistInterfaceController |****** received dealloc message!");

	[super dealloc];
}

- (void)initInterface
{
	tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	[tableViewController.tableView setFrame:CGRectMake(0, 0, [[Config instance] size].width, [[Config instance] size].height - 44)];
	tableViewController.tableView.delegate = self;
	tableViewController.tableView.dataSource = self;
	
	cellArray = [[NSMutableArray arrayWithCapacity:0] retain];
	
	NSString *accountPlaceholder = @"example@mail.com";
	UIFont* font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
	CGSize size = [accountPlaceholder sizeWithFont:font];
	size.height += 4;
	CGFloat width = 190;
	UITextField *account = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, width, size.height)];
	account.placeholder = accountPlaceholder;
	account.returnKeyType = UIReturnKeyDone;
	account.keyboardType = UIKeyboardTypeDefault;
	account.autocorrectionType = UITextAutocorrectionTypeNo;
	account.autocapitalizationType = UITextAutocapitalizationTypeNone;
	account.clearButtonMode = UITextFieldViewModeWhileEditing;
	account.delegate = self;
	NSDictionary *dict0 = [NSDictionary dictionaryWithObjectsAndKeys:account, @"view", @"邮箱地址", @"label", nil];
	
	UITextField *password = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, width, size.height)];
	password.placeholder = @"不少于6个字符";
	password.returnKeyType = UIReturnKeyDone;
	password.keyboardType = UIKeyboardTypeDefault;
	password.autocorrectionType = UITextAutocorrectionTypeNo;
	password.autocapitalizationType = UITextAutocapitalizationTypeNone;
	password.clearButtonMode = UITextFieldViewModeWhileEditing;
	password.secureTextEntry = YES;
	password.delegate = self;
	NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:password, @"view", @"密码", @"label", nil];
	
	UITextField *repassword = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, width, size.height)];
	repassword.placeholder = @"请再次输入确认密码";
	repassword.returnKeyType = UIReturnKeyDone;
	repassword.keyboardType = UIKeyboardTypeDefault;
	repassword.autocorrectionType = UITextAutocorrectionTypeNo;
	repassword.autocapitalizationType = UITextAutocapitalizationTypeNone;
	repassword.clearButtonMode = UITextFieldViewModeWhileEditing;
	repassword.delegate = self;
	repassword.secureTextEntry = YES;
	NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:repassword, @"view", @"确认密码", @"label", nil];
	
	UITextField * realName = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, width, size.height)];
	realName.placeholder = @"请输入您的名字";
	realName.returnKeyType = UIReturnKeyDone;
	realName.keyboardType = UIKeyboardTypeDefault;
	realName.autocorrectionType = UITextAutocorrectionTypeNo;
	realName.autocapitalizationType = UITextAutocapitalizationTypeNone;
	realName.clearButtonMode = UITextFieldViewModeWhileEditing;
	realName.delegate = self;
	NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:realName, @"view", @"姓名", @"label", @"请使用真实姓名更方便其它人查找并联系您", @"description", nil];
	
	UISegmentedControl *sexChooser = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, tableViewController.tableView.frame.size.width, 30)];
	[sexChooser insertSegmentWithTitle:@"男" atIndex:0 animated:NO];
	[sexChooser insertSegmentWithTitle:@"女" atIndex:1 animated:NO];
	NSDictionary *dict4 = [NSDictionary dictionaryWithObjectsAndKeys:sexChooser, @"contentView", @"注册成功后，性别将无法再修改", @"description", nil];
	
	[cellArray addObject:dict0];
	[cellArray addObject:dict1];
	[cellArray addObject:dict2];
	[cellArray addObject:dict3];
	[cellArray addObject:dict4];
	
	[account release];
	[password release];
	[repassword release];
	[realName release];
	[sexChooser release];
	account = nil;
	password = nil;
	repassword = nil;
	realName = nil;
	sexChooser = nil;

	navigator = [[UINavigationController alloc] initWithRootViewController:tableViewController];
	[navigator.view setFrame:CGRectMake(0, 0, [[Config instance] size].width, [[Config instance] size].height)];
	[self.view addSubview:navigator.view];
	
	UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(backward:)];
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleBordered target:self action:@selector(submit:)];
	navigator.navigationItem.leftBarButtonItem = leftButton;
	navigator.navigationItem.rightBarButtonItem = rightButton;
}

- (void)backward:(id)sender
{
	if(delegate && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]){
		
	}
}

- (void)submit:(id)sender
{
	if(delegate && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]){
		
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ToggleableUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	if(cell == nil){
		cell = [[[ToggleableUITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"] autorelease];
	}
	NSDictionary *dict = [cellArray objectAtIndex:indexPath.row];
	NSString *label = [dict valueForKey:@"label"];
	if(label){
		cell.textLabel.text = label;
		UIView *view = [dict valueForKey:@"view"];
		cell.accessoryView = view;
	}else{
		UIView *contentView = [dict valueForKey:@"contentView"];
		cell.backgroundView = contentView;
		cell.contentView.hidden = YES;
	}
//	NSString *des = [dict valueForKey:@"description"];
//	if(des)
//		cell.detailTextLabel.text = des;
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [cellArray count];
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
