//
//  MessageDetailViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"

@class Message;
@interface MessageDetailViewController : KYDBaseViewController{
    UITextView* contentView;
    Message* msg;
}

- (id)initWithMessage:(Message*)message;
- (void)resetMessage:(Message*)message;

@end
