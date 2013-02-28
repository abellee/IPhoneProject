//
//  ShopTableViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-22.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTableViewDelegate.h"

@class KilometerView;
@class RefreshTableViewController;
@interface ShopTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, RefreshTableViewDelegate>{
    RefreshTableViewController* shopTableViewController;
    UIButton* distanceButton;
    UIButton* tasteButton;
    UIButton* recommandButton;
    
    KilometerView* killometerView;
    
    UIView* alphaBlack;
    
    NSMutableArray* shopList;
}

- (void)scrollToTop;

@end
