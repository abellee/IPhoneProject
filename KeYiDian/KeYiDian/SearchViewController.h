//
//  SearchViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-20.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import "RefreshTableViewDelegate.h"
#import "Definitions.h"

@class RefreshTableViewController;
@interface SearchViewController : KYDBaseViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, RefreshTableViewDelegate>{
    UIButton* foodBtn;
    UIButton* shopBtn;
    
    UILabel* noticeLabel;
    
    UISearchBar* searchBar;
    UIActivityIndicatorView* indicatorView;
    
    UIView* masker;
    
    RefreshTableViewController* resultTableViewController;
    
    CollectionType curStatus;
}

@end
