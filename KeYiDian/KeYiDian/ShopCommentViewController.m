//
//  ShopCommentViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-5.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShopCommentViewController.h"
#import "UIImage+Extensions.h"
#import "Utility.h"
#import "CustomTextField.h"
#import "Global.h"

@interface ShopCommentViewController ()

@end

@implementation ShopCommentViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        title = @"评价店铺";
        
        mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        mainScrollView.showsHorizontalScrollIndicator = NO;
        mainScrollView.showsVerticalScrollIndicator = NO;
        mainScrollView.scrollEnabled = NO;
        mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:mainScrollView];
        
        pickerView = [[UIActionSheet alloc] initWithTitle:@"请选择商家此次送餐速度" delegate:self cancelButtonTitle:@"关闭" destructiveButtonTitle:nil otherButtonTitles:@"35-45分钟", @"45-60分钟", @"60分钟以上", nil];
        
        NSString* tasteStr = @"店铺总体:";
        UIFont* font = [UIFont boldSystemFontOfSize:18.0];
        CGSize tasteStrSize = [Utility getCGSizeWithUIFont:font str:tasteStr];
        tasteLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, tasteStrSize.width, tasteStrSize.height)];
        [tasteLabel setText:tasteStr];
        [tasteLabel setTextColor:[UIColor darkGrayColor]];
        [tasteLabel setBackgroundColor:[UIColor clearColor]];
        [tasteLabel setFont:font];
        [mainScrollView addSubview:tasteLabel];
        
        starButtons = [[NSMutableArray alloc] initWithCapacity:0];
        
        UIImage* starImageNormal = [UIImage getImageWithFileName:@"dpdx0"];
        for (int i = 0; i < 5; i++)
        {
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setBackgroundImage:starImageNormal forState:UIControlStateNormal];
            [btn setBackgroundImage:starImageNormal forState:UIControlStateHighlighted];
            [btn setFrame:CGRectMake(i * (starImageNormal.size.width + 5) + 40 + tasteLabel.frame.size.width, 33, starImageNormal.size.width, starImageNormal.size.height)];
            [mainScrollView addSubview:btn];
            btn.tag = i;
            [starButtons addObject:btn];
            [btn addTarget:self action:@selector(starButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [btn release];
        }
        
        speedTextField = [[CustomTextField alloc] initWithFrame:CGRectMake(20, 80, self.view.frame.size.width - 40, 40)];
        [speedTextField setBackgroundColor:[UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0]];
        speedTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        speedTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        speedTextField.layer.cornerRadius = 5.0;
        speedTextField.clipsToBounds = NO;
        speedTextField.layer.shadowColor = [UIColor blackColor].CGColor;
        speedTextField.layer.shadowOffset = CGSizeMake(0, 0);
        speedTextField.layer.shadowOpacity = 0.2;
        speedTextField.layer.shadowRadius = 2.0;
        speedTextField.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, speedTextField.frame.size.width, speedTextField.frame.size.height) cornerRadius:5.0].CGPath;
        [speedTextField setText:@"送餐速度"];
        speedTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        speedTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [speedTextField setTextColor:[UIColor darkGrayColor]];
        [speedTextField setFont:[UIFont systemFontOfSize:14.0]];
        speedTextField.delegate = self;
        [mainScrollView addSubview:speedTextField];
        NSString* str = @"点击选择";
        UIFont* strFont = [UIFont systemFontOfSize:13.0];
        CGSize strSize = [Utility getCGSizeWithUIFont:strFont str:str];
        UILabel* strLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, strSize.width, strSize.height)];
        [strLabel setText:str];
        [strLabel setTextColor:[UIColor grayColor]];
        [strLabel setBackgroundColor:[UIColor clearColor]];
        [strLabel setFont:strFont];
        UIImage* arrowNormal = [UIImage getImageWithFileName:@"pjjt"];
        UIImageView* arrowImageView = [[UIImageView alloc] initWithImage:arrowNormal];
        [arrowImageView setFrame:CGRectMake(strSize.width + 5, 2, arrowNormal.size.width, arrowNormal.size.height)];
        
        float height = MAX(strSize.height, arrowNormal.size.height);
        UIView* rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, strSize.width + 5 + arrowNormal.size.width + 10, height)];
        [rightView addSubview:strLabel];
        [rightView addSubview:arrowImageView];
        
        speedTextField.rightView = rightView;
        speedTextField.rightViewMode = UITextFieldViewModeAlways;
        
        [strLabel release];
        [arrowImageView release];
        [rightView release];
        
        noticeLabel = [[CustomTextField alloc] initWithFrame:CGRectMake(20, 130, self.view.frame.size.width - 40, 100)];
        [noticeLabel setBorderStyle:UITextBorderStyleRoundedRect];
        [noticeLabel setText:@"  您的评价(不少于8个字)"];
        [noticeLabel setTextColor:[UIColor lightGrayColor]];
        [noticeLabel setFont:[UIFont systemFontOfSize:14.0]];
        [mainScrollView addSubview:noticeLabel];
        
        commentTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 130, self.view.frame.size.width - 40, 100)];
        commentTextView.autocapitalizationType = UITextAutocapitalizationTypeNone;
        commentTextView.autocorrectionType = UITextAutocorrectionTypeNo;
        commentTextView.backgroundColor = [UIColor clearColor];
        commentTextView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
        commentTextView.delegate = self;
        [mainScrollView addSubview:commentTextView];
        
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
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTapped:)];
        [mainScrollView addGestureRecognizer:tap];
        [tap release];
    }
    return self;
}

- (void)scrollViewTapped:(UITapGestureRecognizer*)tap
{
    [speedTextField resignFirstResponder];
    [commentTextView resignFirstResponder];
    [mainScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [commentTextView resignFirstResponder];
    [mainScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    [pickerView showInView:self.view];
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if (![[Global sharedInstance] isIPhone5]) {
        [mainScrollView setContentOffset:CGPointMake(0, 60) animated:YES];
    }
    return YES;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        [speedTextField setText:[actionSheet buttonTitleAtIndex:buttonIndex]];
    }
    [speedTextField resignFirstResponder];
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
