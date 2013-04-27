//
//  CommentViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-5.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import <QuartzCore/QuartzCore.h>

@class OrderInfo;
@interface CommentViewController : KYDBaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableViewController* tableViewController;
    
    OrderInfo* orderInfo;
}

- (id)initWithOrderInfo:(OrderInfo*)info;

@end
