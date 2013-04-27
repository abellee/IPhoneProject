//
//  HurryUpHeadView.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-6.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "HurryUpHeadView.h"
#import "OrderInfo.h"
#import "Utility.h"
#import "UIImage+Extensions.h"

@implementation HurryUpHeadView

@synthesize isOpened;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame andOrderInfo:(OrderInfo *)info
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizesSubviews = NO;
        orderInfo = info;
        
        UIFont* shopNameFont = [UIFont boldSystemFontOfSize:16.0];
        UIFont* grayFont = [UIFont systemFontOfSize:14.0];
        
        UIColor* shopNameColor = [UIColor darkGrayColor];
        UIColor* grayColor = [UIColor lightGrayColor];
        UIColor* clearColor = [UIColor clearColor];
        
        NSString* shopNameStr = @"可以点体验店";
        CGSize shopNameStrSize = [Utility getCGSizeWithUIFont:shopNameFont str:shopNameStr];
        shopNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, shopNameStrSize.width, shopNameStrSize.height)];
        [shopNameLabel setText:shopNameStr];
        [shopNameLabel setTextColor:shopNameColor];
        [shopNameLabel setBackgroundColor:clearColor];
        [shopNameLabel setFont:shopNameFont];
        [self addSubview:shopNameLabel];
        
        NSString* orderTimeStr = @"订单时间: 今天10:30";
        CGSize orderTimeStrSize = [Utility getCGSizeWithUIFont:grayFont str:orderTimeStr];
        orderTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, shopNameLabel.frame.origin.y + shopNameLabel.frame.size.height + 5, orderTimeStrSize.width, orderTimeStrSize.height)];
        [orderTimeLabel setText:orderTimeStr];
        [orderTimeLabel setTextColor:grayColor];
        [orderTimeLabel setFont:grayFont];
        [orderTimeLabel setBackgroundColor:clearColor];
        [self addSubview:orderTimeLabel];
        
        UIImage* cuidanNormal = [UIImage getImageWithFileName:@"cd0"];
        UIImage* cuidanHighlighted = [UIImage getImageWithFileName:@"cd1"];
        hurryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [hurryButton setBackgroundImage:cuidanNormal forState:UIControlStateNormal];
        [hurryButton setBackgroundImage:cuidanHighlighted forState:UIControlStateHighlighted];
        [hurryButton setFrame:CGRectMake(self.frame.size.width - cuidanNormal.size.width - 10, (self.frame.size.height - cuidanNormal.size.height) / 2, cuidanNormal.size.width, cuidanNormal.size.height)];
        [self addSubview:hurryButton];
        [hurryButton addTarget:self action:@selector(hurryUp:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)hurryUp:(id)sender
{
    NSLog(@"hurry up");
}

@end
