//
//  FoodDetailViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "FoodDetailViewController.h"
#import "FoodInfo.h"
#import "StarViewController.h"
#import "ZhaoIcon.h"
#import "UIImage+Extensions.h"
#import "CommentItemViewController.h"
#import "Utility.h"

@interface FoodDetailViewController ()

@end

@implementation FoodDetailViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithFoodInfo:(FoodInfo *)info
{
    if (self = [super init]) {
        foodInfo = info;
        title = foodInfo.foodName;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];

    imageFrame = [[UIView alloc] initWithFrame:CGRectMake(13, 13, 294.0, 294.0)];
    imageFrame.layer.backgroundColor = [UIColor whiteColor].CGColor;
    imageFrame.layer.shadowColor = [UIColor blackColor].CGColor;
    imageFrame.layer.shadowOffset = CGSizeMake(0, 0);
    imageFrame.layer.shadowOpacity = 0.2;
    imageFrame.layer.shadowRadius = 2.0;
    imageFrame.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 294, 294) cornerRadius:5.0].CGPath;
    imageFrame.layer.cornerRadius = 5.0;
    imageFrame.layer.contentsGravity = kCAGravityCenter;
    
    UIImage* foodImg = [UIImage getImageWithFileName:@"food"];
    imageFrame.layer.contents = (id)foodImg.CGImage;
    [mainScrollView addSubview:imageFrame];
    
    zhaoIcon = [[ZhaoIcon alloc] init];
    [zhaoIcon setFrame:CGRectMake(13, imageFrame.frame.size.height + imageFrame.frame.origin.y + 10, zhaoIcon.frame.size.width, zhaoIcon.frame.size.height)];
    [mainScrollView addSubview:zhaoIcon];
    
    starViewController = [[StarViewController alloc] init];
    [starViewController.view setFrame:CGRectMake(zhaoIcon.frame.origin.x + zhaoIcon.frame.size.width + 5, (zhaoIcon.frame.size.height - starViewController.view.frame.size.height) / 2 + zhaoIcon.frame.origin.y, starViewController.view.frame.size.width, starViewController.view.frame.size.height)];
    [starViewController setStar:3];
    [mainScrollView addSubview:starViewController.view];
    
    NSString* commentStr = @"最近一个月200个点评";
    CGSize commentStrSize = [Utility getCGSizeWithFontSize:12.0 str:commentStr isBold:NO];
    commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, zhaoIcon.frame.origin.y + zhaoIcon.frame.size.height + 5, 150, commentStrSize.height)];
    [commentNumLabel setBackgroundColor:[UIColor clearColor]];
    [commentNumLabel setText:commentStr];
    [commentNumLabel setTextColor:[UIColor lightGrayColor]];
    [commentNumLabel setFont:[UIFont systemFontOfSize:12.0]];
    [mainScrollView addSubview:commentNumLabel];
    
    NSString* soldStr = @"月售150份";
    CGSize soldStrSize = [Utility getCGSizeWithFontSize:12.0 str:soldStr isBold:NO];
    soldNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 113, commentNumLabel.frame.origin.y, 100, soldStrSize.height)];
    [soldNumLabel setBackgroundColor:[UIColor clearColor]];
    [soldNumLabel setText:soldStr];
    [soldNumLabel setTextColor:[UIColor lightGrayColor]];
    [soldNumLabel setFont:[UIFont systemFontOfSize:12.0]];
    soldNumLabel.textAlignment = NSTextAlignmentRight;
    [mainScrollView addSubview:soldNumLabel];
    
    float buttonWidth = 100.0;
    float gap = 30.0;
    collectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [collectButton setTitle:@"收藏" forState:UIControlStateNormal];
    [collectButton setTitle:@"收藏" forState:UIControlStateHighlighted];
    [collectButton setTitle:@"已收藏" forState:UIControlStateSelected];
    [collectButton setTitle:@"已收藏" forState:UIControlStateSelected | UIControlStateHighlighted];
    [collectButton setFrame:CGRectMake((self.view.frame.size.width - buttonWidth * 2 - gap) / 2, commentNumLabel.frame.origin.y + commentNumLabel.frame.size.height + 20, buttonWidth, 30)];
    [mainScrollView addSubview:collectButton];
    
    priceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [priceButton setTitle:@"13元" forState:UIControlStateNormal];
    [priceButton setTitle:@"13元" forState:UIControlStateHighlighted];
    [priceButton setFrame:CGRectMake(collectButton.frame.size.width + collectButton.frame.origin.x + gap, collectButton.frame.origin.y, buttonWidth, 30)];
    [mainScrollView addSubview:priceButton];
    
    NSString* desStr = @"简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介";
    CGFloat desStrHeight = [Utility getTextHeightWithString:desStr constrainedToSize:CGSizeMake(self.view.frame.size.width - 26, 1000.0) fontSize:12.0 withMinHeight:24.0];
    descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, collectButton.frame.origin.y + collectButton.frame.size.height+ 20, self.view.frame.size.width - 26, desStrHeight)];
    [descriptionLabel setBackgroundColor:[UIColor clearColor]];
    descriptionLabel.lineBreakMode = UILineBreakModeWordWrap;
    descriptionLabel.numberOfLines = 0;
    [descriptionLabel setText:desStr];
    [descriptionLabel setTextColor:[UIColor lightGrayColor]];
    [descriptionLabel setFont:[UIFont systemFontOfSize:12.0]];
    [mainScrollView addSubview:descriptionLabel];
    
    NSString* commentNumStr = @"点评(60条)";
    CGSize commentNumStrSize = [Utility getCGSizeWithFontSize:12.0 str:commentNumStr isBold:NO];
    commentItemNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height + 20, 150, commentNumStrSize.height)];
    [commentItemNumLabel setBackgroundColor:[UIColor clearColor]];
    [commentItemNumLabel setText:commentNumStr];
    [commentItemNumLabel setTextColor:[UIColor lightGrayColor]];
    [commentItemNumLabel setFont:[UIFont systemFontOfSize:12.0]];
    [mainScrollView addSubview:commentItemNumLabel];
    
    for (int i = 0; i < 10; i++) {
        float commentHeight = [self calculateCommentHeight];
        CommentItemViewController* comment = [[CommentItemViewController alloc] initWithFrame:CGRectMake(0, commentItemNumLabel.frame.size.height + commentItemNumLabel.frame.origin.y + 10 + i * (commentHeight + 10), self.view.frame.size.width, commentHeight) withCommentInfo:nil];
        [mainScrollView addSubview:comment.view];
    }
    
    [mainScrollView setContentSize:CGSizeMake(self.view.frame.size.width, 2200.0)];
}

- (float)calculateCommentHeight
{
    return 150;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
