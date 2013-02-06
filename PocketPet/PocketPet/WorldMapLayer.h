//
//  WorldMapLayer.h
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewDelegate.h"

@interface WorldMapLayer : UIViewController{
    UIImageView* background;
    //UIImageView* map;
    UIButton* map;
    
    UIButton* shop;
    UIButton* storehouse;
    UIButton* resource;
    UIButton* pethouse;
    
    id<MainViewDelegate> delegate;
}

@property (nonatomic, retain) UIImageView* background;
//@property (nonatomic, retain) UIImageView* map;
@property (nonatomic, retain) UIButton* map;
@property (nonatomic, retain) UIButton* shop;
@property (nonatomic, retain) UIButton* storehouse;
@property (nonatomic, retain) UIButton* resource;
@property (nonatomic, retain) UIButton* pethouse;
@property (nonatomic, retain, getter = delegate, setter = delegate:) id<MainViewDelegate> delegate;

@end
