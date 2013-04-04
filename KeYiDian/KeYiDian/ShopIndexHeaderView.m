//
//  ShopIndexHeaderView.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-23.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShopIndexHeaderView.h"
#import "UIImage+Extensions.h"
#import "Utility.h"
#import "StarViewController.h"

@implementation ShopIndexHeaderView

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame andShopInfo:(ShopInfo *)info
{
    if (self = [super initWithFrame:frame]) {
        shopInfo = info;
        CALayer* alphaBlackLayer = [CALayer layer];
        [alphaBlackLayer setFrame:CGRectMake(0, 0, self.frame.size.width, 35)];
        alphaBlackLayer.backgroundColor = [UIColor blackColor].CGColor;
        alphaBlackLayer.opacity = 0.5;
        [self.layer addSublayer:alphaBlackLayer];
        
        CAGradientLayer* commentLayer = [CAGradientLayer layer];
        commentLayer.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor, (id)[UIColor whiteColor].CGColor, (id)[UIColor grayColor].CGColor, nil];
        commentLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.3], [NSNumber numberWithFloat:1.0], nil];
        [commentLayer setFrame:CGRectMake(0, 35, self.frame.size.width, 50)];
        [self.layer addSublayer:commentLayer];
        
        UIImage* logoImg = [UIImage getImageWithFileName:@"ceshi05"];
        logoImage = [[UIImageView alloc] initWithImage:logoImg];
        [logoImage setFrame:CGRectMake(20, 5, logoImg.size.width, logoImg.size.height)];
        logoImage.layer.borderColor = [UIColor grayColor].CGColor;
        logoImage.layer.borderWidth = 2.0;
        [self addSubview:logoImage];
        
        NSString* tasteStr = @"中式";
        CGSize tasteStrSize = [Utility getCGSizeWithFontSize:14.0 str:tasteStr isBold:YES];
        shopTasteLabel = [[UILabel alloc] initWithFrame:CGRectMake(logoImage.frame.origin.x + logoImage.frame.size.width + 10, (alphaBlackLayer.frame.size.height - tasteStrSize.height) / 2, tasteStrSize.width, tasteStrSize.height)];
        shopTasteLabel.backgroundColor = [UIColor clearColor];
        [shopTasteLabel setText:tasteStr];
        [shopTasteLabel setTextColor:[UIColor whiteColor]];
        [shopTasteLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
        [self addSubview:shopTasteLabel];
        
        starViewController = [[StarViewController alloc] init];
        [starViewController.view setFrame:CGRectMake(shopTasteLabel.frame.origin.x, commentLayer.frame.origin.y + 5, starViewController.view.frame.size.width, starViewController.view.frame.size.height)];
        [starViewController setStar:4.0];
        [self addSubview:starViewController.view];
        
        NSString* commentStr = @"200评价";
        CGSize commentStrSize = [Utility getCGSizeWithFontSize:12.0 str:commentStr isBold:NO];
        commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(starViewController.view.frame.origin.x + starViewController.view.frame.size.width + 10, starViewController.view.frame.origin.y + (starViewController.view.frame.size.height - commentStrSize.height) / 2, commentStrSize.width, commentStrSize.height)];
        [commentLabel setTextColor:[UIColor grayColor]];
        [commentLabel setText:commentStr];
        [commentLabel setFont:[UIFont systemFontOfSize:12.0]];
        commentLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:commentLabel];
        
        NSString* speedStr = @"平均速度:40-50分钟，10元起送";
        CGSize speedStrSize = [Utility getCGSizeWithFontSize:14.0 str:speedStr isBold:NO];
        speedLabel = [[UILabel alloc] initWithFrame:CGRectMake(starViewController.view.frame.origin.x, starViewController.view.frame.origin.y + starViewController.view.frame.size.height + 5, speedStrSize.width, speedStrSize.height)];
        speedLabel.backgroundColor = [UIColor clearColor];
        [speedLabel setText:speedStr];
        [speedLabel setTextColor:[UIColor darkGrayColor]];
        [speedLabel setFont:[UIFont systemFontOfSize:14.0]];
        [self addSubview:speedLabel];
    }
    return self;
}

@end
