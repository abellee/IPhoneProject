//
//  OrderFormView.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "OrderFormView.h"
#import "OrderInfo.h"
#import "Utility.h"
#import "UIImage+Extensions.h"

@implementation OrderFormView

- (id)initWithFrame:(CGRect)frame andOrderInfo:(OrderInfo *)info
{
    self = [super initWithFrame:frame];
    if (self) {
        orderInfo = info;
        
        CALayer* layer = [CALayer layer];
        layer.backgroundColor = [UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1.0].CGColor;
        [layer setFrame:self.frame];
        layer.shadowColor = [UIColor blackColor].CGColor;
        layer.shadowOffset = CGSizeMake(0, 0);
        layer.shadowOpacity = 0.5;
        layer.shadowRadius = 2;
        layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.frame cornerRadius:0].CGPath;
        [self.layer addSublayer:layer];
        
        UIFont* titleFont = [UIFont boldSystemFontOfSize:16.0];
        UIFont* statusFont = [UIFont boldSystemFontOfSize:14.0];
        UIFont* otherFont = [UIFont systemFontOfSize:12.0];
        
        UIColor* darkGray = [UIColor darkGrayColor];
        UIColor* greenColor = [UIColor colorWithRed:24.0/255.0 green:157.0/255.0 blue:23.0/255.0 alpha:1.0];
        UIColor* lightGray = [UIColor lightGrayColor];
        UIColor* clearColor = [UIColor clearColor];
        
        NSString* shopNameStr = @"二两米餐厅";
        CGSize shopNameStrSize = [Utility getCGSizeWithUIFont:titleFont str:shopNameStr];
        shopNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, shopNameStrSize.width, shopNameStrSize.height)];
        [shopNameLabel setText:shopNameStr];
        [shopNameLabel setTextColor:darkGray];
        [shopNameLabel setBackgroundColor:clearColor];
        [shopNameLabel setFont:titleFont];
        [self addSubview:shopNameLabel];
        
        NSString* orderStausStr = @"订单已完成";
        CGSize orderStatusStrSize = [Utility getCGSizeWithUIFont:statusFont str:orderStausStr];
        statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - orderStatusStrSize.width - 20, 20, orderStatusStrSize.width, orderStatusStrSize.height)];
        [statusLabel setTextColor:greenColor];
        [statusLabel setText:orderStausStr];
        [statusLabel setBackgroundColor:clearColor];
        [statusLabel setFont:statusFont];
        [self addSubview:statusLabel];
        
        NSString* orderNumStr = @"123213213213213";
        CGSize orderNumStrSize = [Utility getCGSizeWithUIFont:otherFont str:orderNumStr];
        orderNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, shopNameLabel.frame.origin.y + shopNameLabel.frame.size.height + 5, orderNumStrSize.width, orderNumStrSize.height)];
        [orderNumLabel setText:orderNumStr];
        [orderNumLabel setTextColor:lightGray];
        [orderNumLabel setBackgroundColor:clearColor];
        [orderNumLabel setFont:otherFont];
        [self addSubview:orderNumLabel];
        
        NSString* timeStr = @"2012-12-24";
        CGSize timeStrSize = [Utility getCGSizeWithUIFont:otherFont str:timeStr];
        orderTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, orderNumLabel.frame.origin.y + orderNumLabel.frame.size.height + 5, timeStrSize.width, timeStrSize.height)];
        [orderTimeLabel setText:timeStr];
        [orderTimeLabel setTextColor:lightGray];
        [orderTimeLabel setBackgroundColor:clearColor];
        [orderTimeLabel setFont:otherFont];
        [self addSubview:orderTimeLabel];
        
        UIImage* telNormal = [UIImage getImageWithFileName:@"dianhua0"];
        UIImage* telHighlighted = [UIImage getImageWithFileName:@"dianhua1"];
        telButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [telButton setBackgroundImage:telNormal forState:UIControlStateNormal];
        [telButton setBackgroundImage:telHighlighted forState:UIControlStateHighlighted];
        [telButton setFrame:CGRectMake(20, orderTimeLabel.frame.origin.y + orderTimeLabel.frame.size.height + 5, telNormal.size.width, telNormal.size.height)];
        [telButton addTarget:self action:@selector(telButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:telButton];
        
        NSString* telNumStr = @"15658685698";
        CGSize telNumStrSize = [Utility getCGSizeWithUIFont:otherFont str:telNumStr];
        telLabel = [[UILabel alloc] initWithFrame:CGRectMake(telButton.frame.origin.x + telButton.frame.size.width, telButton.frame.origin.y + (telButton.frame.size.height - telNumStrSize.height) / 2, telNumStrSize.width, telNumStrSize.height)];
        [telLabel setText:telNumStr];
        [telLabel setTextColor:lightGray];
        [telLabel setBackgroundColor:clearColor];
        [telLabel setFont:otherFont];
        [self addSubview:telLabel];
        
        UIImage* pingjiaNormal = [UIImage getImageWithFileName:@"pingjia0"];
        UIImage* pingjiaHighlighted = [UIImage getImageWithFileName:@"pingjia1"];
        commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [commentButton setBackgroundImage:pingjiaNormal forState:UIControlStateNormal];
        [commentButton setBackgroundImage:pingjiaHighlighted forState:UIControlStateHighlighted];
        [commentButton setFrame:CGRectMake(statusLabel.frame.origin.x + (statusLabel.frame.size.width - pingjiaNormal.size.width) / 2, statusLabel.frame.origin.y + statusLabel.frame.size.height + 5, pingjiaNormal.size.width, pingjiaNormal.size.height)];
        [self addSubview:commentButton];
    }
    return self;
}

- (void)telButtonPressed:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", telLabel.text]]];
}

@end
