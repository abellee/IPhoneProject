//
//  AboutViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-10.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "AboutViewController.h"
#import "UIImage+Extensions.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [logo release];
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        title = @"关于可以点";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImage* aboutLogo = [UIImage getImageWithFileName:@"guangyu"];
    logo = [[UIImageView alloc] initWithImage: aboutLogo];
    [logo setFrame:CGRectMake((self.view.frame.size.width - aboutLogo.size.width) / 2, (self.view.frame.size.height - aboutLogo.size.height) / 2 - 44, aboutLogo.size.width, aboutLogo.size.height)];
    [self.view addSubview:logo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
