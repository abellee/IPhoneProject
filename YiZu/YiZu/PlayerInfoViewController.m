//
//  PlayerInfoViewController.m
//  YiZu
//
//  Created by Lee Abel on 12-10-25.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "PlayerInfoViewController.h"
#import "SystemConfig.h"
#import "PlayerData.h"

@implementation PlayerInfoViewController

@synthesize imageView;
@synthesize nickname;
@synthesize level;
@synthesize nation;

-(id)initWithFrame:(CGRect)rect alpha:(CGFloat)alpha player:(PlayerData *)playerData
{
    [self player:playerData];
    if(self = [super init]){
        background = [[UIView alloc] initWithFrame:rect];
        background.alpha = alpha;
        background.backgroundColor = [UIColor blackColor];
        [self.view addSubview:background];
        
        [self loadAvatar];
    }
    return self;
}

-(void)loadAvatar
{
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:activityView];
    [activityView startAnimating];
    
    NSURL* imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", BASE_URL, AVATAR_DIR, [[self player] avatar_img]]];
    NSURLRequest* request = [NSURLRequest requestWithURL:imageURL];
}

-(void)dealloc
{
    NSLog(@"**********| PlayerInfoViewController dealloc! |***********");
    [super dealloc];
}

@end
