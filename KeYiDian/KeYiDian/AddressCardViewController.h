//
//  AddressCardViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TouchableUILabelDelegate.h"

@class Address;
@class TouchableUILabel;
@class AddressManageViewController;
@interface AddressCardViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, TouchableUILabelDelegate, UIAlertViewDelegate>
{
    UIView* container;
    UITableViewController* addressTableViewController;
    Address* addressInfo;
    TouchableUILabel* defaultAddress;
    AddressManageViewController* addressManager;
    UIButton* deleteButton;
}

- (id)initWithFrame:(CGRect)rect withAddressInfo:(Address*)info parentController:(AddressManageViewController*)controller;

@end
