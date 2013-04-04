//
//  AddressCell.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchableUILabelDelegate.h"

@class TouchableUILabel;
@class AddressManageViewController;
@interface AddressCell : UITableViewCell<UITextFieldDelegate, TouchableUILabelDelegate>
{
    UILabel* textLabel;
    TouchableUILabel* valueLabel;
    AddressManageViewController* addressManager;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withText:(NSString*)text withValue:(NSString*)value andParentController:(AddressManageViewController*)parentController;

@end
