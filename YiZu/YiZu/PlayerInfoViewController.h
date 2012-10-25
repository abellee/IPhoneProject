//
//  PlayerInfoViewController.h
//  YiZu
//
//  Created by Lee Abel on 12-10-25.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayerData;
@interface PlayerInfoViewController : UIViewController{
    UIImageView* imageView;
    UILabel* nickname;
    UILabel* level;
    UILabel* nation;
    
    UIView* background;
    
    PlayerData* player;
    
    UIActivityIndicatorView* activityView;
}

@property (nonatomic, retain) UIImageView* imageView;
@property (nonatomic, retain) UILabel* nickname;
@property (nonatomic, retain) UILabel* level;
@property (nonatomic, retain) UILabel* nation;
@property (nonatomic, retain, getter = player, setter = player:) PlayerData* player;

-(id)initWithFrame:(CGRect)rect alpha:(CGFloat)alpha player:(PlayerData*)playerData;
-(id)initWithBackground:(UIView*)background alpha:(CGFloat)alpha player:(PlayerData*)playerData;
-(void)loadAvatar;
@end
