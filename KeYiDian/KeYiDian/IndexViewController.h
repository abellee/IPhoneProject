//
//  IndexViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-9.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PanViewController.h"

@class ShopTableViewController;
@interface IndexViewController : PanViewController<UINavigationControllerDelegate>{
    UINavigationController* navigator;
    ShopTableViewController* shopTableViewController;
}

- (void)profileButtonPressed;
- (void)moreButtonPressed;
- (void)hurryUpInterface;
- (void)monthlyInterface;
- (void)addressManagerInterface;
- (void)collectionInterface;
- (void)commentManagerInterface;
- (void)processingOrderInterface;
- (void)loginViewInterface;

- (void)searchViewInterface;
- (void)changeLocationInterface;
- (void)aboutInterface;
- (void)feedBackInterface;

@end
