//
//  OrderFoodCell.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "OrderFoodCell.h"
#import "FoodInfo.h"
#import "Utility.h"

@implementation OrderFoodCell

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [foodNum release];
    [foodName release];
    [foodPrice release];
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andFoodInfo:(FoodInfo *)info
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        foodInfo = info;
        
        UIFont* font = [UIFont systemFontOfSize:14.0];
        UIColor* color = [UIColor darkGrayColor];
        UIColor* clearColor = [UIColor clearColor];
        
        NSString* foodNameStr = @"鸡腿汉堡";
        CGSize foodNameStrSize = [Utility getCGSizeWithUIFont:font str:foodNameStr];
        foodName = [[UILabel alloc] initWithFrame:CGRectMake(20, 13, foodNameStrSize.width, foodNameStrSize.height)];
        [foodName setText:foodNameStr];
        [foodName setTextColor:color];
        [foodName setBackgroundColor:clearColor];
        [foodName setFont:font];
        [self addSubview:foodName];
        
        NSString* numStr = @"2份";
        CGSize numStrSize = [Utility getCGSizeWithUIFont:font str:numStr];
        foodNum = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 82 - numStrSize.width, 13, numStrSize.width, numStrSize.height)];
        [foodNum setText:numStr];
        [foodNum setTextColor:color];
        [foodNum setBackgroundColor:clearColor];
        [foodNum setFont:font];
        [self addSubview:foodNum];
        
        NSString* priceStr = @"28元";
        CGSize priceStrSize = [Utility getCGSizeWithUIFont:font str:priceStr];
        foodPrice = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - priceStrSize.width - 20, 13, priceStrSize.width, priceStrSize.height)];
        foodPrice.textAlignment = NSTextAlignmentRight;
        [foodPrice setText:priceStr];
        [foodPrice setTextColor:color];
        [foodPrice setBackgroundColor:clearColor];
        [foodPrice setFont:font];
        [self addSubview:foodPrice];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
