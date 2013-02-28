//
//  KYDViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopTableViewController;
@interface KYDViewController : UIViewController<UINavigationControllerDelegate>{
    UINavigationController* navigator;
    ShopTableViewController* shopTableViewController;
}

@end
