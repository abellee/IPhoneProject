//
//  RefreshTableViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "RefreshTableViewDelegate.h"

@interface RefreshTableViewController : UITableViewController<EGORefreshTableHeaderDelegate>{
    BOOL isLoading;
    EGORefreshTableHeaderView* refreshHeaderView;
    id<RefreshTableViewDelegate> refreshDelegate;
}

@property (nonatomic, assign, getter = refreshDelegate, setter = refreshDelegate:) id<RefreshTableViewDelegate> refreshDelegate;

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;
- (void)scrollViewDidScroll;
- (void)scrollViewDidEndDragging;

@end
