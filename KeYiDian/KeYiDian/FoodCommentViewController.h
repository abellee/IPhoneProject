//
//  FoodCommentViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-5.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDBaseViewController.h"
#import <QuartzCore/QuartzCore.h>

@class CustomTextField;
@interface FoodCommentViewController : KYDBaseViewController<UITextViewDelegate>
{
    UILabel* tasteLabel;
    NSMutableArray* starButtons;
    UITextView* commentTextView;
    CustomTextField* noticeLabel;
    
    int starNum;
}

@end
