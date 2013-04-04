//
//  EditableUITableViewController.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTableViewDelegate.h"

@class EditableUITableViewData;
@class RefreshTableViewController;
@interface EditableUITableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIScrollViewDelegate, RefreshTableViewDelegate>{
	RefreshTableViewController *tableViewController;
	NSMutableArray *textFieldArray;
}

@property (nonatomic, assign, getter = tableViewController) RefreshTableViewController* tableViewController;
@property (nonatomic, retain) EditableUITableViewData *data;

- (id)initTableViewWithFrame:(CGRect)frame widthData:(EditableUITableViewData*)tableData scrollEnabled:(BOOL)scrollEnabled style:(UITableViewStyle)style;

@end
