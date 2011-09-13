//
//  TouchableUILabelDelegate.h
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TouchableUILabel;

@protocol TouchableUILabelDelegate <NSObject>

@required
-(void) touchLabel:(TouchableUILabel *)touchableLabel touchableLabelTag:(NSInteger)tag;

@end
