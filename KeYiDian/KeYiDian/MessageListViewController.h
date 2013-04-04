//
//  MessageListViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import "RefreshTableViewDelegate.h"

@class RefreshTableViewController;
@class MessageDetailViewController;
@interface MessageListViewController : KYDBaseViewController<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, RefreshTableViewDelegate>{
    RefreshTableViewController* messageList;
    MessageDetailViewController* detailViewController;
}

@end
