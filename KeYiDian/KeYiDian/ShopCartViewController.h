//
//  ShopCartViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import <QuartzCore/QuartzCore.h>

@class RadioGroup;
@class UIRadioButton;
@class ShopInfo;
@interface ShopCartViewController : KYDBaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    ShopInfo* shopInfo;
    RadioGroup* radioGroup;
    NSMutableArray* foodList;
    UILabel* deliveryTip;
    UITableViewController* tableViewController;
    UIButton* asSoon;
    UIButton* curAddress;
    
    UILabel* deliveryCostLabel;
    UILabel* saveMoneyLabel;
    UILabel* concurrencyLabel;
    
    UIButton* doneButton;
}

- (id)initWithShopInfo:(ShopInfo*)info andFoodList:(NSMutableArray*)listData;

@end
