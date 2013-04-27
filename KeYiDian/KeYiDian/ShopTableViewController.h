//
//  ShopTableViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-22.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTableViewDelegate.h"
#import "UITouchableViewDelegate.h"

@class KilometerView;
@class RefreshTableViewController;
@class CurrentLocationViewController;
@class UITouchableView;
@class IndexViewController;
@interface ShopTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, RefreshTableViewDelegate, UITouchableViewDelegate>{
    RefreshTableViewController* shopTableViewController;
    CurrentLocationViewController* currentLocationViewController;
    UIButton* distanceButton;
    UIButton* tasteButton;
    UIButton* recommandButton;
    
    KilometerView* killometerView;
    
    UITouchableView* alphaBlack;
    
    NSMutableArray* shopList;
    
    UIButton* currentButton;
}

@property (nonatomic, assign, getter = parentController, setter = parentController:) IndexViewController* parentController;

- (void)scrollToTop;
- (void)resetWidget;
- (void)changeLocation;

@end
