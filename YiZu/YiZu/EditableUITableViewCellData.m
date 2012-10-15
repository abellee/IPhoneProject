//
//  EditableUITableViewCellData.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "EditableUITableViewCellData.h"

@implementation EditableUITableViewCellData

@synthesize label;
@synthesize placeholder;
@synthesize value;
@synthesize key;
@synthesize cellType;

@synthesize keyboardType;
@synthesize keyboardAppearance;
@synthesize returnKeyType;
@synthesize secureTextEntry;

@synthesize width;
@synthesize height;

@synthesize secondView;
@synthesize image;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"******| EditableUITableCellData |****** receive dealloc message!");
    [label release];
    [placeholder release];
    [value release];
	[secondView release];
	[key release];
	[image release];
	
	label = nil;
	placeholder = nil;
	value = nil;
	secondView = nil;
	key = nil;
	image = nil;
	
    [super dealloc];
}

@end
