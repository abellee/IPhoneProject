//
//  CurrentLocationViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "CurrentLocationViewController.h"
#import "UIImage+Extensions.h"
#import "Utility.h"
#import "UITouchableLabel.h"
#import "ShopTableViewController.h"

@interface CurrentLocationViewController ()

@end

@implementation CurrentLocationViewController

@synthesize parentController;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [background release];
    [locationIcon release];
    [locationLabel release];
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        background.backgroundColor = [UIColor blackColor];
        background.alpha = 0.7;
        [self.view addSubview:background];
        
        UIImage* iconImage = [UIImage getImageWithFileName:@"dizhi"];
        locationIcon = [[UIImageView alloc] initWithImage: iconImage];
        [locationIcon setFrame:CGRectMake(10, (background.frame.size.height - iconImage.size.height) / 2, iconImage.size.width, iconImage.size.height)];
        [self.view addSubview:locationIcon];
        
        locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.size.width + 20, locationIcon.frame.origin.y, self.view.frame.size.width - iconImage.size.width - 200, iconImage.size.height)];
        [locationLabel setText:@"正在获取位置信息..."];
        [locationLabel setFont:[UIFont systemFontOfSize:14.0]];
        [locationLabel setTextColor:[UIColor whiteColor]];
        [locationLabel setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:locationLabel];
        
        NSString* changeStr = @"更改位置";
        CGSize changeStrSize = [Utility getCGSizeWithFontSize:14.0 str:changeStr isBold:NO];
        changeLocation = [UIButton buttonWithType:UIButtonTypeCustom];
        [changeLocation setTitle:changeStr forState:UIControlStateNormal];
        [changeLocation setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [changeLocation setBackgroundColor:[UIColor clearColor]];
        [changeLocation.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
        [changeLocation setFrame:CGRectMake(self.view.frame.size.width - changeStrSize.width - 10, (background.frame.size.height - changeStrSize.height) / 2, changeStrSize.width, changeStrSize.height)];
        [self.view addSubview:changeLocation];
        [changeLocation addTarget:self action:@selector(changeLocationPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)changeLocationPressed:(id)sender
{
    if (parentController) {
        [parentController changeLocation];
    }
}

- (void)setLocation:(NSString *)location
{
    [locationLabel setText:location];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
