//
//  RegistViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"

@interface RegistViewController : KYDBaseViewController<UITextFieldDelegate>
{
    UITextField* username;
    UITextField* password;
    UITextField* repassword;
    UITextField* email;
    
    UIButton* registButton;
    UIScrollView* scrollView;
}

@end
