//
//  ShopIndexViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-22.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"

@class ShopInfo;
@class ShoppingCartBarViewController;
@class ShopIndexHeaderView;
@class ShopIntroViewController;
@interface ShopIndexViewController : KYDBaseViewController<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>{
    ShopInfo* shopInfo;
    UITableViewController* tableViewContrller;
    UIScrollView* infoImageScrollView;
    
    NSMutableArray* infoImageArray;
    UIScrollView* mainScrollView;
    
    ShoppingCartBarViewController* shoppingCartBar;
    ShopIndexHeaderView* headerView;
    ShopIntroViewController* shopIntro;
}

- (id)initWithTitle:(NSString*)title andShopInfo:(ShopInfo*)info;

@end
