//
//  CollectionViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import "RefreshTableViewDelegate.h"
#import "Definitions.h"

@class RefreshTableViewController;
@interface CollectionViewController : KYDBaseViewController<UITableViewDataSource, UITableViewDelegate, RefreshTableViewDelegate>{
    UIButton* foodBtn;
    UIButton* shopBtn;
    
    UILabel* noticeLabel;
    
    RefreshTableViewController* resultTableViewController;
    
    CollectionType curStatus;
}

@end
