//
//  OrderAdditionHeadCell.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-5.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "OrderAdditionHeadCell.h"
#import "Utility.h"

@implementation OrderAdditionHeadCell

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andOrderInfo:(OrderInfo *)info
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        orderInfo = info;
        
        UIFont* font = [UIFont systemFontOfSize:14.0];
        NSString* deliveryStr = @"配送费: 0元";
        CGSize deliveryStrSize = [Utility getCGSizeWithUIFont:font str:deliveryStr];
        deliveryCostLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 13, deliveryStrSize.width, deliveryStrSize.height)];
        [deliveryCostLabel setText:deliveryStr];
        [deliveryCostLabel setTextColor:[UIColor darkGrayColor]];
        [deliveryCostLabel setBackgroundColor:[UIColor clearColor]];
        [deliveryCostLabel setFont:font];
        [self addSubview:deliveryCostLabel];
        
        NSString* saveStr = @"优惠: 0元";
        CGSize saveStrSize = [Utility getCGSizeWithUIFont:font str:saveStr];
        saveMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(deliveryCostLabel.frame.origin.x + deliveryCostLabel.frame.size.width + 10, 13, saveStrSize.width, saveStrSize.height)];
        [saveMoneyLabel setText:saveStr];
        [saveMoneyLabel setTextColor:[UIColor darkGrayColor]];
        [saveMoneyLabel setBackgroundColor:[UIColor clearColor]];
        [saveMoneyLabel setFont:font];
        [self addSubview:saveMoneyLabel];
        
        NSString* totalNumStr = @"共2份 合计28元";
        CGSize totalNumStrSize = [Utility getCGSizeWithUIFont:font str:totalNumStr];
        totalNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - totalNumStrSize.width - 20, 13, totalNumStrSize.width, totalNumStrSize.height)];
        [totalNumLabel setText:totalNumStr];
        [totalNumLabel setTextColor:[UIColor darkGrayColor]];
        [totalNumLabel setBackgroundColor:[UIColor clearColor]];
        [totalNumLabel setFont:font];
        [self addSubview:totalNumLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
