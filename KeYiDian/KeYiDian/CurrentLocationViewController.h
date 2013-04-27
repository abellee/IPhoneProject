//
//  CurrentLocationViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITouchableViewDelegate.h"

@class ShopTableViewController;
@interface CurrentLocationViewController : UIViewController<UITouchableViewDelegate>{
    UIImageView* locationIcon;
    UIView* background;
    UIButton* changeLocation;
    UILabel* locationLabel;
}

@property (nonatomic, assign, getter = parentContrller, setter = parentController:) ShopTableViewController* parentController;

- (void)setLocation:(NSString*)location;

@end
