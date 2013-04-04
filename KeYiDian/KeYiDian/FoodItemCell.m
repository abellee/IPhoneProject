//
//  FoodItemCell.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-25.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "FoodItemCell.h"
#import "Utility.h"
#import "StarViewController.h"

#import "UIImage+Extensions.h"

@implementation FoodItemCell

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andFoodInfo:(ShopInfo *)info
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        foodInfo = info;
        
        NSString* foodNameStr = @"大鸡腿饭";
        CGSize foodNameStrSize = [Utility getCGSizeWithFontSize:14.0 str:foodNameStr isBold:NO];
        foodName = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, foodNameStrSize.width, foodNameStrSize.height)];
        [foodName setText:foodNameStr];
        [foodName setTextColor:[UIColor darkGrayColor]];
        [foodName setFont:[UIFont systemFontOfSize:14.0]];
        [foodName setBackgroundColor:[UIColor clearColor]];
        [self addSubview:foodName];
        
        starViewController = [[StarViewController alloc] init];
        [starViewController.view setFrame:CGRectMake(foodName.frame.origin.x, foodName.frame.origin.y + foodName.frame.size.height + 5, starViewController.view.frame.size.width, starViewController.view.frame.size.height)];
        [starViewController setStar:3];
        [self addSubview:starViewController.view];
        
        NSString* soldNumStr = @"月售150份";
        CGSize soldNumStrSize = [Utility getCGSizeWithFontSize:12.0 str:soldNumStr isBold:NO];
        soldNum = [[UILabel alloc] initWithFrame:CGRectMake(starViewController.view.frame.origin.x + starViewController.view.frame.size.width + 5, starViewController.view.frame.origin.y + (starViewController.view.frame.size.height - soldNumStrSize.height) / 2, soldNumStrSize.width, soldNumStrSize.height)];
        [soldNum setText:soldNumStr];
        [soldNum setTextColor:[UIColor grayColor]];
        [soldNum setFont:[UIFont systemFontOfSize:12.0]];
        [soldNum setBackgroundColor:[UIColor clearColor]];
        [self addSubview:soldNum];
        
        NSString* priceStr = @"100元/份";
        CGSize priceStrSize = [Utility getCGSizeWithFontSize:14.0 str:priceStr isBold:NO];
        priceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [priceButton setFrame:CGRectMake(self.frame.size.width - 110, (self.frame.size.height - priceStrSize.height - 10) / 2, priceStrSize.width + 10, priceStrSize.height + 10)];
        [priceButton setTitle:priceStr forState:UIControlStateNormal];
        [priceButton.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
        [priceButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self addSubview:priceButton];
        
        float btnWidth = 30.0;
        float btnHeight = 30.0;
        divButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage* divSkin = [Utility drawCircle:CGSizeMake(btnWidth, btnHeight) withColor:[UIColor orangeColor]];
        [divButton setBackgroundImage:divSkin forState:UIControlStateNormal];
        [divButton setFrame:CGRectMake(self.frame.size.width - btnWidth - 10, (self.frame.size.height - btnHeight) / 2, btnWidth, btnHeight)];
        [self addSubview:divButton];
        
        UIImage* img = [Utility drawRect:CGSizeMake(40, 15) withColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0] withAlpha:0.5];
        numLabel = [[UILabel alloc] initWithFrame:CGRectMake(priceButton.frame.origin.x + (priceButton.frame.size.width - img.size.width) / 2, priceButton.frame.origin.y + priceButton.frame.size.height + 2, img.size.width, img.size.height)];
        [numLabel setBackgroundColor:[UIColor colorWithPatternImage:img]];
        [numLabel setText:@"10"];
        [numLabel setTextColor:[UIColor whiteColor]];
        [numLabel setFont:[UIFont systemFontOfSize:12.0]];
        numLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview: numLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
