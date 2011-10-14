//
//  MovingTribalController.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MovingTribalController.h"

@implementation MovingTribalController

- (void)dealloc
{
	NSLog(@"******| MovingTribal |****** received dealloc message!");
	[loginInterface release];
	[registInterface release];
	loginInterface = nil;
	registInterface = nil;
	[super dealloc];
}

- (id)init
{
	self = [super init];
	if(self){
		NSLog(@"init!");
		[self performSelector:@selector(showLoginInterface)];
	}
	return self;
}

- (void)showLoginInterface
{
	loginInterface = [[LoginInterfaceController alloc] init];
	[loginInterface.view setFrame:CGRectMake(0, 0, [[Config instance] size].width, [[Config instance] size].height)];
	loginInterface.delegate = self;
	[self.view addSubview:loginInterface.view];
}

- (void)showRegistInterface
{
	registInterface = [[RegistInterfaceController alloc] init];
	[registInterface.view setFrame:CGRectMake(0, 0, [[Config instance] size].width, [[Config instance] size].height)];
	registInterface.delegate = self;
	[self.view addSubview:registInterface.view];
	
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
