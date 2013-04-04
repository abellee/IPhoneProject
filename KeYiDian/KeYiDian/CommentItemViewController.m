//
//  CommentItemViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "CommentItemViewController.h"
#import "StarViewController.h"
#import "Utility.h"
#import "Comment.h"
#import "KYDUser.h"

@interface CommentItemViewController ()

@end

@implementation CommentItemViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)rect withCommentInfo:(Comment *)comment
{
    if (self = [super init]) {
        [self.view setFrame:rect];
        commentData = comment;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    float fullWidth = self.view.frame.size.width - 20 * 2;
    
    float gap = 5.0;
    NSString* usernameStr = @"吃货啊吃货";
    CGSize usernameStrSize = [Utility getCGSizeWithFontSize:16.0 str:usernameStr isBold:NO];
    usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.view.frame.size.width, usernameStrSize.height)];
    usernameLabel.backgroundColor = [UIColor clearColor];
    [usernameLabel setText:usernameStr];
    [usernameLabel setTextColor:[UIColor darkGrayColor]];
    [usernameLabel setFont:[UIFont systemFontOfSize:16.0]];
    [self.view addSubview:usernameLabel];
    
    starViewController = [[StarViewController alloc] init];
    [starViewController.view setFrame:CGRectMake(20, usernameLabel.frame.origin.y + usernameLabel.frame.size.height + gap, starViewController.view.frame.size.width, starViewController.view.frame.size.height)];
    [starViewController setStar:4.0];
    [self.view addSubview:starViewController.view];
    
    NSString* commentStr = @"好吃好吃真好吃好吃好吃真好吃好吃好吃真好吃好吃好吃真好吃好吃好吃真好吃好吃好吃真好吃好吃好吃真好吃好吃好吃真好吃好吃好吃真好吃好吃好吃真好吃";
    CGFloat commentStrHeight = [Utility getTextHeightWithString:commentStr constrainedToSize:CGSizeMake(fullWidth, 100.0) fontSize:14.0 withMinHeight:24.0];
    commentContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, starViewController.view.frame.origin.y + starViewController.view.frame.size.height + gap, fullWidth, commentStrHeight)];
    commentContentLabel.lineBreakMode = UILineBreakModeWordWrap;
    commentContentLabel.numberOfLines = 0;
    commentContentLabel.backgroundColor = [UIColor clearColor];
    [commentContentLabel setText:commentStr];
    [commentContentLabel setTextColor:[UIColor darkGrayColor]];
    [commentContentLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.view addSubview:commentContentLabel];
    
    NSString* timeStr = @"2013-01-02 10:52";
    CGSize timeStrSize = [Utility getCGSizeWithFontSize:12.0 str:timeStr isBold:NO];
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, commentContentLabel.frame.origin.y + commentContentLabel.frame.size.height + gap, fullWidth, timeStrSize.height)];
    timeLabel.backgroundColor = [UIColor clearColor];
    [timeLabel setText:timeStr];
    [timeLabel setTextColor:[UIColor lightGrayColor]];
    [timeLabel setFont:[UIFont systemFontOfSize:12.0]];
    [self.view addSubview:timeLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
