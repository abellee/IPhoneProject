//
//  TouchableUIScrollView.m
//  MovingTribal
//
//  Created by Lee Abel on 9/25/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "TouchableUIScrollView.h"

@implementation TouchableUIScrollView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.nextResponder touchesBegan:touches withEvent:event];
}

@end
