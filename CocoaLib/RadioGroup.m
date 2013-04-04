//
//  RadioGroup.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "RadioGroup.h"
#import "UIRadioButton.h"

@implementation RadioGroup

@synthesize value, text, delegate;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [radioButtons removeAllObjects];
    [radioButtons release];
    [text release];
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        radioButtons = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (void)radioButtonPressed:(id)sender
{
    UIRadioButton* btn = (UIRadioButton*)sender;
    if (!btn.isSelected)
    {
        for (UIRadioButton* rb in radioButtons)
        {
            [rb isSelected:NO];
        }
        [btn isSelected:YES];
        [self valueChanged:btn];
    }
}

- (void)addRadioButton:(UIRadioButton *)radioButton
{
    if ([self isInTheList:radioButton]) {
        return;
    }
    radioButton.delegate = self;
    if (radioButton.isSelected)
    {
        [self valueChanged:radioButton];
    }
    [radioButtons addObject:radioButton];
}

- (void)valueChanged:(UIRadioButton*)radioButton
{
    value = radioButton.tag;
    text = [radioButton getTitleForState:UIControlStateSelected];
    
    if (delegate && [delegate respondsToSelector:@selector(radioGroupDidChanged:)]) {
        [delegate performSelector:@selector(radioGroupDidChanged:) withObject:radioButton];
    }
}

- (BOOL)isInTheList:(UIRadioButton *)radioButton
{
    for (UIRadioButton* rb in radioButtons) {
        if (rb.tag == radioButton.tag && [[rb getTitleForState:UIControlStateNormal] isEqualToString:[radioButton getTitleForState:UIControlStateNormal]] && [[rb getTitleForState:UIControlStateSelected] isEqualToString:[radioButton getTitleForState:UIControlStateSelected]]) {
            return YES;
        }
    }
    return NO;
}

@end
