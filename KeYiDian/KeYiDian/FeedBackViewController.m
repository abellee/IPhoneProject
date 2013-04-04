//
//  FeedBackViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "FeedBackViewController.h"
#import "Utility.h"
#import "UIImage+Extensions.h"

@interface FeedBackViewController ()

@end

@implementation FeedBackViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        title = @"反馈意见";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    float textFieldWith = self.view.frame.size.width - 30;
    float textFieldHeight = 150.0;
    feed = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, textFieldWith, textFieldHeight)];
    feed.backgroundColor = [UIColor whiteColor];
    feed.layer.cornerRadius = 10.0;
    feed.layer.borderColor = [UIColor lightGrayColor].CGColor;
    feed.layer.borderWidth = 1.0;
    feed.autocapitalizationType = UITextAutocapitalizationTypeNone;
    feed.autocorrectionType = UITextAutocorrectionTypeNo;
    [feed setFont:[UIFont systemFontOfSize:16.0]];
    [feed setTextColor:[UIColor grayColor]];
    feed.showsHorizontalScrollIndicator = NO;
    feed.contentSize = CGSizeMake(textFieldWith - 20, textFieldHeight - 20);
    [self.view addSubview:feed];
    
    notice = [[UILabel alloc] initWithFrame:CGRectMake(15, 20 + textFieldHeight, textFieldWith, 40)];
    notice.textAlignment = NSTextAlignmentLeft;
    notice.lineBreakMode = UILineBreakModeWordWrap;
    notice.numberOfLines = 0;
    [notice setText:@"我们正在为更好的用户体验不断努力，欢迎您提出宝贵的建议和意见！"];
    [notice setTextColor:[UIColor grayColor]];
    [notice setFont:[UIFont systemFontOfSize:14.0]];
    notice.backgroundColor = [UIColor clearColor];
    [self.view addSubview:notice];
    
    NSString* labelStr = @"反馈信息 请关注";
    CGSize labelStrSize = [Utility getCGSizeWithFontSize:18.0 str:labelStr isBold:YES];
    label = [[UILabel alloc] initWithFrame:CGRectMake(15, notice.frame.origin.y + notice.frame.size.height + 20, labelStrSize.width, labelStrSize.height)];
    [label setText:labelStr];
    [label setFont:[UIFont boldSystemFontOfSize:18.0]];
    [label setTextColor:[UIColor darkGrayColor]];
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
    
    message = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* myMessageSkin = [UIImage getImageWithFileName:@"wode"];
    [message setFrame:CGRectMake(label.frame.origin.x + label.frame.size.width + 10, label.frame.origin.y, myMessageSkin.size.width, myMessageSkin.size.height)];
    [message setImage:myMessageSkin forState:UIControlStateNormal];
    [self.view addSubview:message];
    
    UIButton* submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* submitNormalSkin = [UIImage getImageWithFileName:@"tijiao0"];
    UIImage* submitHighlightedSkin = [UIImage getImageWithFileName:@"tijiao1"];
    [submitButton setImage:submitNormalSkin forState:UIControlStateNormal];
    [submitButton setImage:submitHighlightedSkin forState:UIControlStateNormal];
    [submitButton setFrame:CGRectMake(0, 0, submitNormalSkin.size.width, submitNormalSkin.size.height)];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, submitButton.frame.size.width, submitButton.frame.size.height)];
    [view addSubview:submitButton];
    UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    [view release];
    [rightBarButtonItem release];
    [submitButton addTarget:self action:@selector(submitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [feed resignFirstResponder];
}

- (void)submitButtonPressed:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
