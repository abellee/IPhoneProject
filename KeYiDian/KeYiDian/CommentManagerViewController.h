//
//  CommentManagerViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-6.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import "RefreshTableViewDelegate.h"

@class RefreshTableViewController;
@interface CommentManagerViewController : KYDBaseViewController<UITableViewDataSource, UITableViewDelegate, RefreshTableViewDelegate>
{
    NSMutableArray* commentDataArray;
    RefreshTableViewController* tableViewController;
}

- (id)initWithCommentData:(NSMutableArray*)array;

@end
