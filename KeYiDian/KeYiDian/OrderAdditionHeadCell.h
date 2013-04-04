//
//  OrderAdditionHeadCell.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-5.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrderInfo;
@interface OrderAdditionHeadCell : UITableViewCell
{
    OrderInfo* orderInfo;
    UILabel* deliveryCostLabel;
    UILabel* saveMoneyLabel;
    UILabel* totalNumLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andOrderInfo:(OrderInfo*)info;

@end
