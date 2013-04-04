//
//  ShopDetailViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-25.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "ShopInfo.h"
#import "ShopIndexHeaderView.h"
#import "UIImage+Extensions.h"
#import "ShopIntroDetailViewController.h"
#import "Utility.h"
#import "CommentItemViewController.h"
#import "Comment.h"

@interface ShopDetailViewController ()

@end

@implementation ShopDetailViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)initWithShopInfo:(ShopInfo *)info
{
    if (self = [super init]) {
        shopInfo = info;
        title = shopInfo.shopName;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImage* infoImage = [UIImage getImageWithFileName:@"caomei"];
    UIImageView* infoImageView = [[UIImageView alloc] initWithImage:infoImage];
    
    infoImageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -60, infoImage.size.width, infoImage.size.height)];
    infoImageScrollView.pagingEnabled = YES;
    infoImageScrollView.contentSize = CGSizeMake(2000, infoImage.size.height);
    infoImageScrollView.showsHorizontalScrollIndicator = NO;
    infoImageScrollView.showsVerticalScrollIndicator = NO;
    [infoImageScrollView addSubview:infoImageView];
    
    headerView = [[ShopIndexHeaderView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 85) andShopInfo:nil];
    
    float introDetailHeight = [self calculateHeight];
    shopIntroDetail = [[ShopIntroDetailViewController alloc] initWithFrame:CGRectMake(0, 105, self.view.frame.size.width, introDetailHeight) withShopInfo:shopInfo];
    
    mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2200);
    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];
    
    [mainScrollView addSubview:infoImageScrollView];
    [mainScrollView addSubview:headerView];
    [mainScrollView addSubview:shopIntroDetail.view];
    
    NSString* commentNumStr = @"评论(10)";
    CGSize commentNumStrSize = [Utility getCGSizeWithFontSize:12.0 str:commentNumStr isBold:NO];
    commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, introDetailHeight + shopIntroDetail.view.frame.origin.y + 10, self.view.frame.size.width, commentNumStrSize.height)];
    commentNumLabel.backgroundColor = [UIColor clearColor];
    [commentNumLabel setText:commentNumStr];
    [commentNumLabel setTextColor:[UIColor darkGrayColor]];
    [commentNumLabel setFont:[UIFont systemFontOfSize:12.0]];
    [mainScrollView addSubview:commentNumLabel];
    
    UIImage* collectNormal = [UIImage getImageWithFileName:@"s_xing0"];
    UIImage* collectHighlighted = [UIImage getImageWithFileName:@"s_xing1"];
    UIButton* collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [collectButton setBackgroundImage:collectNormal forState:UIControlStateNormal];
    [collectButton setBackgroundImage:collectHighlighted forState:UIControlStateHighlighted];
    [collectButton setBackgroundImage:collectHighlighted forState:UIControlStateSelected];
    [collectButton setBackgroundImage:collectHighlighted forState:UIControlStateSelected | UIControlStateHighlighted];
    [collectButton setFrame:CGRectMake(0, 0, collectNormal.size.width, collectNormal.size.height)];
    [collectButton setSelected:shopInfo.isCollected];
    [collectButton addTarget:self action:@selector(collectButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView* view = [[UIView alloc] initWithFrame:collectButton.frame];
    [view addSubview:collectButton];
    UIBarButtonItem* collectBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = collectBarButtonItem;
    [collectBarButtonItem release];
    [view release];
    
    for (int i = 0; i < 10; i++) {
        float commentHeight = [self calculateCommentItemHeight:nil];
        CommentItemViewController* commentItem = [[CommentItemViewController alloc] initWithFrame:CGRectMake(0, commentNumLabel.frame.origin.y + commentNumStrSize.height + i * (commentHeight + 10) + 10, self.view.frame.size.width, commentHeight) withCommentInfo:nil];
        [mainScrollView addSubview:commentItem.view];
    }
}

- (void)collectButtonPressed:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    [btn setSelected:!shopInfo.isCollected];
    shopInfo.isCollected = btn.selected;
}

- (float)calculateHeight
{
    return 420;
}

- (float)calculateCommentItemHeight:(Comment*)comment
{
    return 150;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
