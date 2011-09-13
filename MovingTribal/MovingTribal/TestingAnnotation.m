//
//  TestingAnnotation.m
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TestingAnnotation.h"

@implementation TestingAnnotation

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D pos;
    pos.latitude = 37.810000;
    pos.longitude = -122.477989;
    return pos;
}

- (NSString *)title
{
    return @"London Bridge brake down!";
}

- (NSString *)subtitle
{
    return @"subtitle? no no no!";
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
