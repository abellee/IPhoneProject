//
//  FeedBackViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "KYDBaseViewController.h"

@interface FeedBackViewController : KYDBaseViewController{
    UITextView* feed;
    UILabel* notice;
    UILabel* label;
    UIButton* message;
}

@end
