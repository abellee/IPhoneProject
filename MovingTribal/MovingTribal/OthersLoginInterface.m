//
//  OthersLoginInterface.m
//  MovingTribal
//
//  Created by Lee Abel on 9/13/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "OthersLoginInterface.h"

@implementation OthersLoginInterface

@synthesize otherPlatformList;
@synthesize backwardBtn;
@synthesize platformList;

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"others login interface dealloc");
    [otherPlatformList release];
    [platformList release];
    delegate = nil;
    [super dealloc];
}

- (void)setView:(UIView *)view
{
    [super setView:view];
    
    [self initInterface];
}

- (void)initInterface
{
    platformList = [[NSArray alloc] initWithObjects:@"新浪微博", @"腾讯微博", nil];
    
    CGRect rect = CGRectMake(20, 20, 280, 420);
    UITableView* tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor = [UIColor clearColor];
    otherPlatformList = [UITableViewController alloc];
    [otherPlatformList setView:tableView];
    [tableView release];
    [self.view addSubview:otherPlatformList.view];
    
    CGRect buttonRect = CGRectMake(0, 0, 60, 30);
    backwardBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backwardBtn setFrame:buttonRect];
    [backwardBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backwardBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backwardBtn];
}

- (void)buttonPressed:(id)sender
{
    if(delegate != nil && [delegate conformsToProtocol:@protocol(InterfaceDelegate)]){
        [delegate exitOtherLoginInterface:self.view.tag];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIndentifier = @"PlatformCellIndentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        [cell autorelease];
    }
    NSUInteger row = indexPath.row;
    cell.textLabel.text = [platformList objectAtIndex:row];
    cell.imageView.image = [UIImage imageNamed:@"32.png"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [platformList count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"you selected row %d", indexPath.row);
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
