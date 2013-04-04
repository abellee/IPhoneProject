//
//  CartFoodCell.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "CartFoodCell.h"
#import "FoodInfo.h"
#import "NumericViewController.h"
#import "Utility.h"
#import "UIImage+Extensions.h"

@implementation CartFoodCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andFoodInfo:(FoodInfo *)info
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        float selfHeight = 60;
        self.autoresizesSubviews = NO;
        foodInfo = info;
        NSString* priceStr = @"15元/份";
        CGSize priceStrSize = [Utility getCGSizeWithUIFont:[UIFont systemFontOfSize:12.0] str:priceStr];
        
        NSString* foodNameStr = @"大鸡腿饭";
        CGSize foodNameStrSize = [Utility getCGSizeWithUIFont:[UIFont boldSystemFontOfSize:16.0] str:foodNameStr];
        foodNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, (selfHeight - foodNameStrSize.height - priceStrSize.height - 2) / 2, foodNameStrSize.width, foodNameStrSize.height)];
        [foodNameLabel setText:foodNameStr];
        [foodNameLabel setTextColor:[UIColor darkGrayColor]];
        [foodNameLabel setBackgroundColor:[UIColor clearColor]];
        [foodNameLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
        [self addSubview:foodNameLabel];
        
        priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, foodNameLabel.frame.size.height + foodNameLabel.frame.origin.y + 2, priceStrSize.width, priceStrSize.height)];
        [priceLabel setBackgroundColor:[UIColor clearColor]];
        [priceLabel setText:priceStr];
        [priceLabel setTextColor:[UIColor lightGrayColor]];
        [priceLabel setFont:[UIFont systemFontOfSize:12.0]];
        [self addSubview:priceLabel];

        float buttonSize = 30;
        addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [addButton setFrame:CGRectMake(self.frame.size.width - buttonSize * 3 - 40, (selfHeight - buttonSize) / 2, buttonSize, buttonSize)];
        [self addSubview:addButton];
        [addButton addTarget:self action:@selector(addButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        divButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [divButton setFrame:CGRectMake(self.frame.size.width - buttonSize - 20, addButton.frame.origin.y, buttonSize, buttonSize)];
        [self addSubview:divButton];
        [divButton addTarget:self action:@selector(divButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        numeric = [[NumericViewController alloc] initWithFrame:CGRectMake(addButton.frame.origin.x + addButton.frame.size.width + 10, addButton.frame.origin.y, buttonSize, buttonSize) andMinNum:0 andCurrentNum:1 andMaxNum:100];
        [numeric setFont:[UIFont systemFontOfSize:18.0] withColor:[UIColor whiteColor]];
        [numeric setBackground:[UIColor orangeColor]];
        [self addSubview:numeric.view];
    }
    return self;
}

- (void)addButtonPressed:(id)sender
{
    [numeric add];
}

- (void)divButtonPressed:(id)sender
{
    [numeric sub];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
