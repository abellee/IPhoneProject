//
//  SystemSettingInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "SystemSettingInterface.h"
#import "EditableUITableCellData.h"

@implementation SystemSettingInterface

@synthesize tableView;

@synthesize delegate;

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
    NSLog(@"******| SystemSettingInterface |****** receive dealloc message!");
    [tableView release];
    delegate = nil;
    [super dealloc];
}

- (void)save
{
	NSLog(@"save system setting");
	NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
	[defaults setValue:@"李金贝贝" forKey:@"username"];
	[defaults setValue:@"YES" forKey:@"nickname"];
}

- (void)initInterface
{
	NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    EditableUITableCellData* cell0 = [[[EditableUITableCellData alloc] init] autorelease];
    [cell0 label: @"昵称"];
    [cell0 placeholder: @"请输入昵称"];
    [cell0 value: [defaults objectForKey:@"username"]];
    [cell0 keyboardType: UIKeyboardTypeDefault];
    [cell0 keyboardAppearance: UIKeyboardAppearanceDefault];
    [cell0 returnKeyType: UIReturnKeyDone];
    [cell0 isSecureTextEntry: NO];
	[cell0 key: @"username"];
	[cell0 cellType: kTextField];
    [cell0 width: 150];
    [cell0 height: 1000];

    EditableUITableCellData* cell1 = [[[EditableUITableCellData alloc] init] autorelease];
    [cell1 label: @"昵称2"];
    [cell1 placeholder: @"请输入昵称2"];
    [cell1 value: [defaults objectForKey:@"nickname"]];
    [cell1 keyboardType: UIKeyboardTypeDefault];
    [cell1 keyboardAppearance: UIKeyboardAppearanceDefault];
    [cell1 returnKeyType: UIReturnKeyDone];
    [cell1 isSecureTextEntry: NO];
	[cell1 key: @"nickname"];
	[cell1 cellType: kSwitch];
    [cell1 width: 150];
    [cell1 height: 1000];
    
    NSArray* tempArr = [[NSArray alloc] initWithObjects:cell0, cell1, nil];
    NSArray* arrData = [[NSArray alloc] initWithObjects:tempArr, nil];
    EditableUITableViewData* tableViewData = [[EditableUITableViewData alloc] init];
    [tableViewData data: arrData];
    
    tableView = [[EditableUITableView alloc] init];
    [tableView.view setFrame:self.view.frame];
    [tableView data: tableViewData];
	[tableView sectionHeader:@"第一批"];
    [tableView identifier: @"FirstSection"];
    [self.view addSubview:tableView.view];
    
    [tableViewData release];
    [tempArr release];
    [arrData release];
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
