//
//  ToggleableUITableViewCell.m
//  MovingTribal
//
//  Created by Lee Abel on 9/22/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "ToggleableUITableViewCell.h"

@implementation ToggleableUITableViewCell

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:YES animated:YES];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:YES];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:YES];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self setSelected:NO animated:YES];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
