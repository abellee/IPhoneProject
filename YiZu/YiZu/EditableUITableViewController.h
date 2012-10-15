//
//  EditableUITableViewController.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditableUITableViewData.h"
#import "ToggleableUITableViewCell.h"

@interface EditableUITableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
	UITableViewController *tableViewController;
	NSMutableArray *textFieldArray;
}

@property (nonatomic, retain) EditableUITableViewData *data;

- (id)initTableViewWithFrame:(CGRect)frame scrollEnabled:(BOOL)scrollEnabled;

@end
