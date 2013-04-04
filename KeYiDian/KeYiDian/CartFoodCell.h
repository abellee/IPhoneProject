//
//  CartFoodCell.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FoodInfo;
@class NumericViewController;
@interface CartFoodCell : UITableViewCell
{
    FoodInfo* foodInfo;
    UILabel* foodNameLabel;
    UILabel* priceLabel;
    
    UIButton* addButton;
    UIButton* divButton;
    NumericViewController* numeric;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andFoodInfo:(FoodInfo*)info;

@end
