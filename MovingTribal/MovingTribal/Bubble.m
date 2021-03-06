//
//  Bubble.m
//  MovingTribal
//
//  Created by Lee Abel on 9/24/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "Bubble.h"

@implementation Bubble

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
	NSLog(@"******| Bubble |****** receive dealloc message!");
	delegate = nil;
	[super dealloc];
}

- (void)initInterface
{
	
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
