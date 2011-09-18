//
//  TestingAnnotation.m
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TestingAnnotation.h"

@implementation TestingAnnotation

- (void)dealloc
{
    NSLog(@"******| TestingAnnotation |****** receive dealloc message!");
}

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D pos;
    pos.latitude = 30.21635515266855;
    pos.longitude = 120.2947998046875;
    return pos;
}

- (NSString *)title
{
    NSString* str = @"London Bridge brake down!";
    [str autorelease];
    return str;
}

- (NSString *)subtitle
{
    NSString* str = @"subtitle? no no no!";
    [str autorelease];
    return str;
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
