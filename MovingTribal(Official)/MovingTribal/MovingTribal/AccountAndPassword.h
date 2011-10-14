//
//  AccountAndPassword.h
//  MovingTribal
//
//  Created by Abel Lee on 10/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditableUITableViewController.h"
#import "RegistInterfaceDelegate.h"
#import "Config.h"

@interface AccountAndPassword : UIViewController{
	EditableUITableViewController *tableViewController;
	
	NSString *account;
	NSString *password;
}

@property (nonatomic, assign) id<RegistInterfaceDelegate>delegate;

- (id)initWithFrame:(CGRect)frame;

@end
