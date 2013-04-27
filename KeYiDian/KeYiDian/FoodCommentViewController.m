//
//  FoodCommentViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-5.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "FoodCommentViewController.h"
#import "UIImage+Extensions.h"
#import "Utility.h"
#import "CustomTextField.h"

@interface FoodCommentViewController ()

@end

@implementation FoodCommentViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        title = @"评价美食";
        
        NSString* tasteStr = @"总体口味:";
        UIFont* font = [UIFont boldSystemFontOfSize:18.0];
        CGSize tasteStrSize = [Utility getCGSizeWithUIFont:font str:tasteStr];
        tasteLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, tasteStrSize.width, tasteStrSize.height)];
        [tasteLabel setText:tasteStr];
        [tasteLabel setTextColor:[UIColor darkGrayColor]];
        [tasteLabel setBackgroundColor:[UIColor clearColor]];
        [tasteLabel setFont:font];
        [self.view addSubview:tasteLabel];
        
        starButtons = [[NSMutableArray alloc] initWithCapacity:0];
        
        UIImage* starImageNormal = [UIImage getImageWithFileName:@"dpdx0"];
        for (int i = 0; i < 5; i++)
        {
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setBackgroundImage:starImageNormal forState:UIControlStateNormal];
            [btn setBackgroundImage:starImageNormal forState:UIControlStateHighlighted];
            [btn setFrame:CGRectMake(i * (starImageNormal.size.width + 5) + 40 + tasteLabel.frame.size.width, 33, starImageNormal.size.width, starImageNormal.size.height)];
            [self.view addSubview:btn];
            btn.tag = i;
            [starButtons addObject:btn];
            [btn addTarget:self action:@selector(starButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [btn release];
        }
        
        noticeLabel = [[CustomTextField alloc] initWithFrame:CGRectMake(20, 80, self.view.frame.size.width - 40, 100)];
        [noticeLabel setBorderStyle:UITextBorderStyleRoundedRect];
        [noticeLabel setText:@"  您的评价(不少于8个字)"];
        [noticeLabel setTextColor:[UIColor lightGrayColor]];
        [noticeLabel setFont:[UIFont systemFontOfSize:14.0]];
        [self.view addSubview:noticeLabel];
        
        commentTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 80, self.view.frame.size.width - 40, 100)];
        commentTextView.autocapitalizationType = UITextAutocapitalizationTypeNone;
        commentTextView.autocorrectionType = UITextAutocorrectionTypeNo;
        commentTextView.backgroundColor = [UIColor clearColor];
        commentTextView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
        commentTextView.delegate = self;
        [self.view addSubview:commentTextView];
        
        UIImage* tijiaoNormal = [UIImage getImageWithFileName:@"tijiao0"];
        UIImage* tijiaoHighlighted = [UIImage getImageWithFileName:@"tijiao1"];
        
        UIButton* submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [submitButton setBackgroundImage:tijiaoNormal forState:UIControlStateNormal];
        [submitButton setBackgroundImage:tijiaoHighlighted forState:UIControlStateHighlighted];
        [submitButton setFrame:CGRectMake(0, 0, tijiaoNormal.size.width, tijiaoNormal.size.height)];
        
        UIView* view = [[UIView alloc] initWithFrame:submitButton.frame];
        [view addSubview:submitButton];
        
        UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
        self.navigationItem.rightBarButtonItem = barButtonItem;
        [view release];
        [barButtonItem release];
    }
    return self;
}

- (void)textViewDidChange:(UITextView *)textView
{
    [noticeLabel setText:@""];
}

- (void)starButtonPressed:(id)sender
{
    [self resetButtons];
    UIImage* starImageHighlighted = [UIImage getImageWithFileName:@"dpdx1"];
    UIButton* btn = (UIButton*)sender;
    starNum = btn.tag + 1;
    for (int i = 0; i < btn.tag + 1; i++) {
        UIButton* button = [starButtons objectAtIndex:i];
        [button setBackgroundImage:starImageHighlighted forState:UIControlStateNormal];
        [button setBackgroundImage:starImageHighlighted forState:UIControlStateHighlighted];
    }
}

- (void)resetButtons
{
    UIImage* starImageNormal = [UIImage getImageWithFileName:@"dpdx0"];
    for (int i = 0; i < 5; i++) {
        UIButton* button = [starButtons objectAtIndex:i];
        [button setBackgroundImage:starImageNormal forState:UIControlStateNormal];
        [button setBackgroundImage:starImageNormal forState:UIControlStateHighlighted];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
