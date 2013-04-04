//
//  OrderFoodCell.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FoodInfo;
@interface OrderFoodCell : UITableViewCell
{
    FoodInfo* foodInfo;
    UILabel* foodName;
    UILabel* foodNum;
    UILabel* foodPrice;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andFoodInfo:(FoodInfo*)info;

@end
