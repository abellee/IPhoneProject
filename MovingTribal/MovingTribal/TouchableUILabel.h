//
//  TouchableUILabel.h
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchableUILabelDelegate.h"

@interface TouchableUILabel : UILabel{
    id <TouchableUILabelDelegate> delegate;
}

@property (nonatomic, assign) id <TouchableUILabelDelegate> delegate;

@end