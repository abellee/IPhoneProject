//
//  EditableUITableView.h
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditableUITableViewData.h"

@interface EditableUITableView : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
    EditableUITableViewData* data;
    NSString* identifier;
    UITableViewCellStyle cellStyle;
    UITableView* tableView;
}

@property (nonatomic, assign, getter = data, setter = data:) EditableUITableViewData* data;
@property (nonatomic, assign, getter = identifier, setter = identifier:) NSString* identifier;
@property (nonatomic, assign, getter = cellStyle, setter = cellStyle:) UITableViewCellStyle cellStyle;
@property (nonatomic, retain) UITableView* tableView;

@end
