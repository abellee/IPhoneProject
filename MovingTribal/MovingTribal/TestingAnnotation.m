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
@synthesize anoTitle;
@synthesize anoSubtitle;
@synthesize uid;

- (void)dealloc
{
    NSLog(@"******| TestingAnnotation |****** receive dealloc message!");
	[anoTitle release];
	[anoTitle release];
	anoTitle = nil;
	anoTitle = nil;
	[super dealloc];
}

- (id)initWidthCoordinate:(CLLocationCoordinate2D)coor
{
    self = [super init];
    if(self){
        coordinate = coor;
    }
    return self;
}

- (int)uid
{
	return uid;
}

- (void)uid:(int)num
{
	if(uid != num){
		uid = num;
	}
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
    return anoTitle;
}

- (void)title:(NSString *)str
{
	if(anoTitle != str){
		[anoTitle release];
		anoTitle = [str retain];
	}
}

- (NSString *)subtitle
{
    return anoSubtitle;
}

- (void)subtitle:(NSString *)str
{
	if(anoSubtitle != str){
		[anoSubtitle release];
		anoSubtitle = [str retain];
	}
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
