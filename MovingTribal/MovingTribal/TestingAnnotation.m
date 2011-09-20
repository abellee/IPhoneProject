//
//  TestingAnnotation.m
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TestingAnnotation.h"

@implementation TestingAnnotation

@synthesize coordinate;

- (void)dealloc
{
    NSLog(@"******| TestingAnnotation |****** receive dealloc message!");
}

- (id)initWidthCoordinate:(CLLocationCoordinate2D)coor
{
    self = [super init];
    if(self){
        coordinate = coor;
    }
    return self;
}

- (CLLocationCoordinate2D)coordinate
{
    return coordinate;
}

- (void)coordinate:(CLLocationCoordinate2D)coor
{
    coordinate = coor;
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
