//
//  ShopLikeTableViewCell.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShopLikeTableViewCell.h"
#import "ShadowImageViewController.h"
#import "StarViewController.h"
#import "Global.h"
#import "ShopInfo.h"
#import "ImageURL.h"

@implementation ShopLikeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier info:(ShopInfo *)info type:(CollectionType)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        curType = type;
        shopInfo = info;
        float selfHeight = 100;
        
        shadowImage = [[ShadowImageViewController alloc] init];
        CGSize shadowImageSize = shadowImage.view.frame.size;
        float shadowImageYPos = (selfHeight - shadowImage.view.frame.size.height) / 2;
        [shadowImage.view setFrame:CGRectMake(10, shadowImageYPos, shadowImage.view.frame.size.width, shadowImage.view.frame.size.height)];
        [shadowImage loadImage:shopInfo.imageURL.thumbImage];
        
        float shopNameFontSize = 18.0;
        NSString* shopNameStr = shopInfo.shopName;
        CGSize shopNameSize = [shopNameStr sizeWithFont:[UIFont boldSystemFontOfSize:shopNameFontSize]];
        shopNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(shadowImageSize.width + 20, shadowImageYPos, shopNameSize.width, shopNameSize.height)];
        [shopNameLabel setText:shopNameStr];
        [shopNameLabel setTextColor:[UIColor darkGrayColor]];
        [shopNameLabel setFont:[UIFont boldSystemFontOfSize:shopNameFontSize]];
        shopNameLabel.backgroundColor = [UIColor clearColor];
        
        CGPoint shopNamePoint = shopNameLabel.frame.origin;
        
        float shopTypeFontSize = 14.0;
        NSString* shopTypeStr = [Global getShopTypeStringWithIntType:shopInfo.shopType];
        CGSize shopTypeSize = [shopTypeStr sizeWithFont:[UIFont systemFontOfSize:shopTypeFontSize]];
        shopTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(shopNamePoint.x, shopNamePoint.y + shopNameSize.height + 2, shopTypeSize.width, shopTypeSize.height)];
        [shopTypeLabel setText:shopTypeStr];
        [shopTypeLabel setTextColor:[UIColor grayColor]];
        [shopTypeLabel setFont:[UIFont systemFontOfSize:shopTypeFontSize]];
        shopTypeLabel.backgroundColor = [UIColor clearColor];
        
        float starViewYPos = shadowImageYPos + shadowImageSize.height - 15;
        float starViewXPos = shopNamePoint.x;
        starViewController = [[StarViewController alloc] init];
        [starViewController.view setFrame:CGRectMake(starViewXPos, starViewYPos, starViewController.view.frame.size.width, starViewController.view.frame.size.height)];
        [starViewController setStar:shopInfo.starNum];
        
        CGSize starViewSize = starViewController.view.frame.size;
        
        float commentFontSize = 14.0;
        NSString* commentStr = [NSString stringWithFormat:@"%d个评价", shopInfo.commentNum];
        if (curType == FOOD) {
            commentStr = [NSString stringWithFormat:@"月售%d份", shopInfo.commentNum];
        }
        CGSize commentStrSize = [commentStr sizeWithFont:[UIFont systemFontOfSize:commentFontSize]];
        commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(starViewXPos + starViewSize.width + 10, starViewYPos + (starViewSize.height - commentStrSize.height) / 2, commentStrSize.width, commentStrSize.height)];
        [commentLabel setText:commentStr];
        [commentLabel setTextColor:[UIColor grayColor]];
        [commentLabel setFont:[UIFont systemFontOfSize:commentFontSize]];
        commentLabel.backgroundColor = [UIColor clearColor];
        
        float distanceFontSize = 16.0;
        NSString* distanceStr = [NSString stringWithFormat:@"%d%@", shopInfo.distance < 1000 ? shopInfo.distance : shopInfo.distance / 1000, shopInfo.distance < 1000 ? @"m" : @"km"];
        if (curType == FOOD) {
            distanceStr = [NSString stringWithFormat:@"%d元", shopInfo.distance];
        }
        CGSize distanceStrSize = [distanceStr sizeWithFont:[UIFont systemFontOfSize:distanceFontSize]];
        distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - distanceStrSize.width - 10, shopNamePoint.y, distanceStrSize.width, distanceStrSize.height)];
        [distanceLabel setText:distanceStr];
        [distanceLabel setTextColor:[UIColor grayColor]];
        [distanceLabel setFont:[UIFont systemFontOfSize:distanceFontSize]];
        distanceLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:shadowImage.view];
        [self addSubview:starViewController.view];
        [self addSubview:shopNameLabel];
        [self addSubview:shopTypeLabel];
        [self addSubview:commentLabel];
        [self addSubview:distanceLabel];
    }
    return self;
}

- (void)reuseByInfo:(ShopInfo *)info type:(CollectionType)type
{
//    curType = type;
//    shopInfo = info;
//    float commentFontSize = 14.0;
//    NSString* commentStr = [NSString stringWithFormat:@"%d个评价", shopInfo.commentNum];
//    if (curType == FOOD) {
//        commentStr = [NSString stringWithFormat:@"月售%d份", shopInfo.commentNum];
//    }
//    CGSize commentStrSize = [commentStr sizeWithFont:[UIFont systemFontOfSize:commentFontSize]];
//    [commentLabel setFrame:CGRectMake(starViewController.view.frame.origin.x + starViewController.view.frame.size.width + 10, starViewController.view.frame.origin.y + (starViewController.view.frame.size.height - commentStrSize.height) / 2, commentStrSize.width, commentStrSize.height)];
//    [starViewController setStar:info.starNum];
//    
//    float distanceFontSize = 16.0;
//    NSString* distanceStr = [NSString stringWithFormat:@"%d%@", shopInfo.distance < 1000 ? shopInfo.distance : shopInfo.distance / 1000, shopInfo.distance < 1000 ? @"m" : @"km"];
//    if (curType == FOOD) {
//        distanceStr = [NSString stringWithFormat:@"%d元", shopInfo.distance];
//    }
//    CGSize distanceStrSize = [distanceStr sizeWithFont:[UIFont systemFontOfSize:distanceFontSize]];
//    [distanceLabel setFrame:CGRectMake(self.frame.size.width - distanceStrSize.width - 10, shopNamePoint.y, distanceStrSize.width, distanceStrSize.height)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if (selected) {
        self.backgroundColor = [UIColor colorWithRed:240.0 green:240.0 blue:240.0 alpha:1.0];
    }else{
        self.backgroundColor = [UIColor clearColor];
    }
}

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [shadowImage release];
    [shopNameLabel release];
    [shopTypeLabel release];
    [commentLabel release];
    [distanceLabel release];
    
    shadowImage = nil;
    shopNameLabel = nil;
    shopTypeLabel = nil;
    commentLabel = nil;
    distanceLabel = nil;
    shopInfo = nil;
    
    [super dealloc];
}

@end
