//
//  SearchableListInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "SearchableListInterface.h"
#import "UserData.h"
#import "Globals.h"

@implementation SearchableListInterface

@synthesize tableViewController;
@synthesize searchBar;
@synthesize keys;
@synthesize names;
@synthesize delegate;
@synthesize type;

- (void)dealloc
{
    NSLog(@"******| SearchableListInterface |****** receive dealloc message!");
    [tableViewController release];
    [searchBar release];
    [keys release];
	[names release];
    delegate = nil;
	type = nil;
    [super dealloc];
}

- (id)initWithType:(NSString *)typeStr
{
    self = [super init];
    if(self){
		type = typeStr;
        [self performSelector:@selector(initInterface)];
    }
    return self;
}

- (void)initInterface
{
	NSArray* indexArr = [[NSArray alloc] initWithObjects:@"A", nil];
	NSArray* nameArr0;
	if([Globals getUserData].uid == 10001){
		nameArr0 = [[NSArray alloc] initWithObjects:@"Amak", nil];
	}else{
		nameArr0 = [[NSArray alloc] initWithObjects:@"Abel Lee", nil];
	}
	NSArray* nameArr = [[NSArray alloc] initWithObjects:nameArr0, nil];
    NSDictionary* list = [[NSDictionary alloc] initWithObjects:nameArr forKeys:indexArr];
	names = [list retain];
	keys = [[[names allKeys] sortedArrayUsingSelector:@selector(compare:)] retain];
	[indexArr release];
	[nameArr0 release];
	[nameArr release];
	[list release];
    tableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    [tableViewController.view setFrame:CGRectMake(0,  50,  self.view.frame.size.width,  self.view.frame.size.height - 90)];
    tableViewController.tableView.delegate = self;
    tableViewController.tableView.dataSource = self;
    [self.view addSubview:tableViewController.view];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0,  self.view.frame.size.width,  50)];
    searchBar.delegate = self;
    searchBar.placeholder = @"搜索";
    searchBar.keyboardType = UIKeyboardTypeDefault;
    searchBar.barStyle = UIBarStyleBlackOpaque;
    [self.view addSubview:searchBar];
}

- (void)editCell
{
	[tableViewController.tableView setEditing:!tableViewController.tableView.editing animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)sb
{
    [sb resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)sb
{
    [sb setShowsCancelButton:YES animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString* name = [list objectAtIndex:indexPath.row];
    if(delegate != nil && [delegate conformsToProtocol:@protocol(MainContainerDelegate)]){
		UserData* userData;
		if([Globals getUserData].uid == 10001){
			userData = [[UserData alloc] init];
			[userData uid:10002];
			[userData nickname: @"Amak"];
		}else{
			userData = [[UserData alloc] init];
			[userData uid:10001];
			[userData nickname: @"Abel Lee"];
		}
        if(type == @"chatList"){
			[delegate showChatInterface:userData];
		}else{
			[delegate showProfileInterface:userData];
		}
		[userData release];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* str = @"FriendItem";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		[cell setEditing:NO animated:YES];
    }
    cell.textLabel.text = [[names objectForKey:[keys objectAtIndex:[indexPath section]]] objectAtIndex:[indexPath row]];
    cell.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"32" ofType:@"png"]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return  [[names objectForKey:[keys objectAtIndex:section]] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [keys count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
	return keys;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSString* key = [keys objectAtIndex:section];
	return key;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"commit edit!");
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleDelete;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [list count];
//}

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
