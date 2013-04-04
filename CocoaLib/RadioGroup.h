//
//  RadioGroup.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIRadioButton;
@interface RadioGroup : NSObject
{
    NSMutableArray* radioButtons;
    id delegate;
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id delegate;
@property (nonatomic, assign, getter = value) int value;
@property (nonatomic, copy, getter = text) NSString* text;

- (void)addRadioButton:(UIRadioButton*)radioButton;
- (void)radioButtonPressed:(id)sender;

@end
