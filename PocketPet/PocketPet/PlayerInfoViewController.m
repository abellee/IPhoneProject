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
#import "Loader.h"
#import "ImageDownloadData.h"

@implementation PlayerInfoViewController

@synthesize imageView;
@synthesize nickname;
@synthesize level;
@synthesize nation;
@synthesize player;

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

-(id)initWithBackground:(UIView *)bk alpha:(CGFloat)alpha player:(PlayerData *)playerData
{
    [self player:playerData];
    if(self = [super init]){
        background = bk;
        background.alpha = alpha;
        [self.view addSubview:background];
    }
    return self;
}

-(void)loadAvatar
{
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:activityView];
    [activityView startAnimating];
    
    NSURL* imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", BASE_URL, AVATAR_DIR, [[self player] avatar_img]]];
    loader = [[Loader alloc] init];
    ImageDownloadData* imageDownloadData = [[ImageDownloadData alloc] init];
    [imageDownloadData url:imageURL];
    [imageDownloadData delegate:self];
    [loader addImage:imageDownloadData];
    [imageDownloadData release];
    imageDownloadData = nil;
    [loader load];
}

-(void)downloadComplete:(UIImage *)image
{
    [activityView stopAnimating];
    [activityView removeFromSuperview];
    [activityView release];
    activityView = nil;
    
    imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
}

-(void)dealloc
{
    NSLog(@"**********| PlayerInfoViewController dealloc! |***********");
    if(activityView){
        [activityView stopAnimating];
        [activityView release];
        activityView = nil;
    }
    [nickname release];
    [level release];
    [nation release];
    
    if(imageView) [imageView release];
    if(loader) [loader release];
    if(background) [background release];
    if(player) [player release];
    
    [super dealloc];
}

@end
