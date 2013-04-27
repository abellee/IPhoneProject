//
//  HurryUpViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-6.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import "RefreshTableViewDelegate.h"

@class RefreshTableViewController;
@interface HurryUpViewController : KYDBaseViewController<UITableViewDataSource, UITableViewDelegate, RefreshTableViewDelegate>
{
    NSMutableArray* orderInfoList;
    RefreshTableViewController* tableViewController;
    UILabel* noticeLabel;
    NSMutableArray* headViewList;
}

- (id)initWithOrderInfoList:(NSMutableArray*)array;

@end
