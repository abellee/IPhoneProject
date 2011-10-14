//
//  RegistInterfaceController.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentInterfaceController.h"
#import "Config.h"
#import "AvatarChooser.h"
#import "ToggleableUITableViewCell.h"

@interface RegistInterfaceController : ParentInterfaceController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>{
	UINavigationController *navigator;
	UITableViewController *tableViewController;
	AvatarChooser *avatarChooser;
	NSMutableArray *cellArray;
}

@end
