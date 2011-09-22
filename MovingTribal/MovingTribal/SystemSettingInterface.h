//
//  SystemSettingInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MainContainerDelegate.h"
#import "EditableUITableView.h"

@interface SystemSettingInterface : UIViewController{
    id<MainContainerDelegate> delegate;
    
    EditableUITableView* tableView;
}

@property (nonatomic, retain) id<MainContainerDelegate> delegate;
@property (nonatomic, retain) EditableUITableView* tableView;

- (void)save;

@end
