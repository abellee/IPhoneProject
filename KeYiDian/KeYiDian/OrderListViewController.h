//
//  OrderListViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"

@interface OrderListViewController : KYDBaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableViewController* tableViewController;
    NSMutableArray* listData;
    NSMutableArray* sectionViews;
}

- (id)initWithData:(NSMutableArray*)data;

@end
