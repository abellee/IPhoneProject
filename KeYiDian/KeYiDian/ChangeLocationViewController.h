//
//  ChangeLocationViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-20.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"

@interface ChangeLocationViewController : KYDBaseViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
    UITextField* locationText;
    UIButton* gpsButton;
    UITableViewController* historyViewController;
    UIPickerView* picker;
    UIToolbar* pickerToolBar;
}

@end
