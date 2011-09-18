//
//  SearchableListInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "SearchableListInterface.h"
#import "UserData.h"

@implementation SearchableListInterface

@synthesize tableViewController;
@synthesize searchBar;
@synthesize list;
@synthesize delegate;

- (void)dealloc
{
    NSLog(@"******| SearchableListInterface |****** receive dealloc message!");
    [tableViewController release];
    [searchBar release];
    [list release];
    delegate = nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if(self){
        [self performSelector:@selector(initInterface)];
    }
    return self;
}

- (void)initInterface
{
    list = [[NSArray alloc] initWithObjects:@"好友1", @"好友2", @"好友1", @"好友2", @"好友1", @"好友2", @"好友1", @"好友2", @"好友1", @"好友2", @"好友1", @"好友2", @"好友1", @"好友2", @"好友1", @"好友2", @"好友1", @"好友2", @"好友1", @"好友2", nil];
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
        UserData* userData = [[UserData alloc] init];
        [userData uid:5];
        [userData username: @"李金贝"];
        [delegate showChatInterface:userData];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [userData release];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* str = @"FriendItem";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
    }
    cell.textLabel.text = [list objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"32" ofType:@"png"]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
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
