//
//  RegistInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/12/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "InterfaceDelegate.h"

@interface RegistInterface : UIViewController<UITextFieldDelegate>{
    id <InterfaceDelegate> delegate;
    
    UILabel* titleLabel;
    UIButton* backwardBtn;
    UIButton* registBtn;
    UITextField* nickname;
    UITextField* account;
    UITextField* password;
}

@property (nonatomic, assign) id<InterfaceDelegate> delegate;

@property (nonatomic, retain) UILabel* titleLabel;
@property (nonatomic, retain) UIButton* backwardBtn;
@property (nonatomic, retain) UIButton* registBtn;
@property (nonatomic, retain) UITextField* nickname;
@property (nonatomic, retain) UITextField* account;
@property (nonatomic, retain) UITextField* password;

- (void)initInterface;
- (void)resignAll;

@end
