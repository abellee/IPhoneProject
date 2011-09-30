//
//  EditableUITableView.h
//  MovingTribal
//
//  Created by Lee Abel on 9/18/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditableUITableViewData.h"
#import "EditableUITableViewDefinition.h"

@interface EditableUITableView : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
    EditableUITableViewData* data;
	
    UITableView* tableView;
	
	NSString* identifier;
	NSString* sectionHeader;
}

@property (nonatomic, assign, getter = data, setter = data:) EditableUITableViewData* data;
@property (nonatomic, retain) UITableView* tableView;
@property (nonatomic, assign, getter = identifier, setter = identifier:) NSString* identifier;
@property (nonatomic, assign, getter = sectionHeader, setter = sectionHeader:) NSString* sectionHeader;

- (id)initWithFrame:(CGRect)rect;

@end
