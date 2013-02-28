//
//  StarViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-22.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "StarViewController.h"
#import "UIImage+Extensions.h"

@interface StarViewController ()

@end

@implementation StarViewController

- (id)init
{
    if (self = [super init]) {
        curStarNum = -1;
    }
    return self;
}

- (void)viewDidLoad
{
    UIImage* grayStar = [[UIImage getImageWithFileName:@"s_xing0"] scaleToSize:CGSizeMake(15, 15)];
    UIImage* yellowStar = [[UIImage getImageWithFileName:@"s_xing1"] scaleToSize:CGSizeMake(15, 15)];
    
    singleStarSize = grayStar.size;
    
    emptyStars = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, grayStar.size.width * 5, grayStar.size.height)];
    emptyStars.backgroundColor = [UIColor colorWithPatternImage:grayStar];
    
    int starNum = 5;
    if (curStarNum > -1) {
        starNum = curStarNum;
    }
    
    fullStars = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, yellowStar.size.width * starNum, yellowStar.size.height)];
    fullStars.backgroundColor = [UIColor colorWithPatternImage:yellowStar];
    [self.view setFrame:fullStars.frame];
    [self.view addSubview:emptyStars];
    [self.view addSubview:fullStars];
}

- (void)setStar:(int)starNum
{
    if (singleStarSize.width > 0) {
        [fullStars setFrame:CGRectMake(0, 0, starNum * singleStarSize.width, singleStarSize.height)];
    }else{
        curStarNum = starNum;
    }
}

- (void)dealloc
{
    NSLog(@"************** StarViewController dealloc *****************");
    
    [emptyStars release];
    [fullStars release];
    emptyStars = nil;
    fullStars = nil;
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
