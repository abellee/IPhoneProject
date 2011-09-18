//
//  SearchableListInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "MainContainerDelegate.h"

@interface SearchableListInterface : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>{
    id<MainContainerDelegate> delegate;
    
    UITableViewController* tabViewController;
    UISearchBar* searchBar;
    NSArray* list;
}

@property (nonatomic, assign) id<MainContainerDelegate> delegate;
@property (nonatomic, retain) UITableViewController* tableViewController;
@property (nonatomic, retain) UISearchBar* searchBar;
@property (nonatomic, assign) NSArray* list;

@end
