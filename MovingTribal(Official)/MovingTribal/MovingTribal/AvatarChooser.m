//
//  AvatarChooser.m
//  MovingTribal
//
//  Created by Abel Lee on 10/15/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "AvatarChooser.h"

@implementation AvatarChooser

- (void)dealloc
{
	NSLog(@"******| AvatarChooser |****** received dealloc message!");
	[avatar removeTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[choosePhoto removeTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[chooseCamera removeTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[super dealloc];
}

- (id)initWidthFrame:(CGRect)frame
{
	self = [super init];
	if(self){
		[self.view setFrame:frame];
		[self performSelector:@selector(initInterface)];
	}
	return self;
}

- (void)initInterface
{
	avatar = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[avatar setFrame:CGRectMake(0, 0, 80, 80)];
	[avatar addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:avatar];
	
	CGFloat width = self.view.frame.size.width - 90;
	choosePhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[choosePhoto setFrame:CGRectMake(90, 5, width, 30)];
	[choosePhoto setTitle:@"选择相册照片" forState:UIControlStateNormal];
	[choosePhoto addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:choosePhoto];
	
	chooseCamera = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[chooseCamera setFrame:CGRectMake(90, 45, width, 30)];
	[chooseCamera setTitle:@"马上拍一张" forState:UIControlStateNormal];
	[chooseCamera addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:chooseCamera];
}

- (void)buttonPressed:(id)sender
{
	UIButton *button = (UIButton *)sender;
	if(button){
		if([button isEqual:avatar]){
			
		}else if([button isEqual:chooseCamera]){
			
		}else if([button isEqual:choosePhoto]){
			
		}
	}
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
