//
//  TouchableUILabel.m
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TouchableUILabel.h"

@implementation TouchableUILabel

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(delegate && [delegate conformsToProtocol:@protocol(TouchableUILabelDelegate)])
		[delegate touchesBeganWithTouchableUILabel:self];
	[super touchesBegan:touches withEvent:event];
}

- (void)dealloc
{
	NSLog(@"******| TouchableUILabel |****** received dealloc message!");
	delegate = nil;
	[super dealloc];
}

@end
