//
//  ShopLikeTableViewCell.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShadowImageViewController;
@class ShopInfo;
@class StarViewController;
@interface ShopLikeTableViewCell : UITableViewCell{
    ShadowImageViewController* shadowImage;
    ShopInfo* shopInfo;
    StarViewController* starViewController;
    
    UILabel* shopNameLabel;
    UILabel* shopTypeLabel;
    UILabel* commentLabel;
    UILabel* distanceLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier info:(ShopInfo*)info;

@end
