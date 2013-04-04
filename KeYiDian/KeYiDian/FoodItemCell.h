//
//  FoodItemCell.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-25.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopInfo;
@class StarViewController;
@interface FoodItemCell : UITableViewCell
{
    ShopInfo* foodInfo;
    UIImageView* thumbImage;
    UILabel* foodName;
    UILabel* soldNum;
    StarViewController* starViewController;
    UIButton* priceButton;
    UIButton* divButton;
    UILabel* numLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andFoodInfo:(ShopInfo*)info;

@end
