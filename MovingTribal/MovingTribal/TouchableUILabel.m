//
//  TouchableUILabel.m
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TouchableUILabel.h"

@implementation TouchableUILabel

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"touchable ui label dealloc");
    delegate = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [delegate touchLabel:self touchableLabelTag:self.tag];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
