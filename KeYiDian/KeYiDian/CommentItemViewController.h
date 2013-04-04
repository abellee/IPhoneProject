//
//  CommentItemViewController.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Comment;
@class StarViewController;
@interface CommentItemViewController : UIViewController
{
    Comment* commentData;
    StarViewController* starViewController;
    UILabel* usernameLabel;
    UILabel* commentContentLabel;
    UILabel* timeLabel;
}

- (id)initWithFrame:(CGRect)rect withCommentInfo:(Comment*)comment;

@end
