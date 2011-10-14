//
//  TouchableUILabel.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchableUILabelDelegate.h"

@interface TouchableUILabel : UILabel

@property (nonatomic, assign) id<TouchableUILabelDelegate> delegate;

@end
