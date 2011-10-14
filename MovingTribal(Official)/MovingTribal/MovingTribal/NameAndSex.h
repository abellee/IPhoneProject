//
//  NameAndSex.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditableUITableViewController.h"
#import "RegistInterfaceDelegate.h"
#import "Config.h"

@interface NameAndSex : UIViewController{
	EditableUITableViewController *tableViewController;
	UISegmentedControl *sexSegmented;
	
	NSString *realName;
	int sex;
}

@property (nonatomic, assign) id<RegistInterfaceDelegate>delegate;

- (id)initWithFrame:(CGRect)frame;

@end
