//
//  TouchableUILabel.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchableUILabelDelegate.h"

@interface TouchableUILabel : UILabel
{
    
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id<TouchableUILabelDelegate> delegate;

@end
