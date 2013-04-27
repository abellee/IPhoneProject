//
//  LeftSideViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-1.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleButton;
@interface LeftSideViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>{
    UIButton* avatarBtn;
    UIButton* logoffBtn;
    SimpleButton* hurryButton;
    
    UILabel* usernameLabel;
    UILabel* messageLabel;
    
    UITableViewController* functionList;
    
    NSArray* functions;
}

@end
