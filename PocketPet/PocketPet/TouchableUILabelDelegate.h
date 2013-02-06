//
//  TouchableUILabelDelegate.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TouchableUILabel;

@protocol TouchableUILabelDelegate <NSObject>

@optional
- (void)touchesBeganWithTouchableUILabel:(TouchableUILabel *)label;

@end
