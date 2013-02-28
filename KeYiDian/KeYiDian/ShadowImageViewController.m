//
//  ShadowImageViewController.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-22.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShadowImageViewController.h"
#import "UIImage+Extensions.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "Global.h"
#import "UIImage+Extensions.h"

@interface ShadowImageViewController ()

@end

@implementation ShadowImageViewController

@synthesize isLoading;

- (id)init
{
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    background = [[UIImageView alloc] initWithImage:[UIImage getImageWithFileName:@"tupiandi"]];
    [self.view setFrame:CGRectMake(0, 0, background.frame.size.width, background.frame.size.height)];
    [self.view addSubview:background];
    
    indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.center = CGPointMake(background.frame.size.width / 2, background.frame.size.height / 2);
    [indicatorView startAnimating];
    [self.view addSubview:indicatorView];
}

- (void)loadImage:(NSString *)src
{
    NSURL* url = [NSURL URLWithString:src];
    ASIHTTPRequest* request = [[ASIHTTPRequest alloc] initWithURL:url];
    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    request.delegate = self;
    [[[Global sharedInstance] networkQueue] addOperation:request];
    [request release];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    UIImage* image = [[UIImage imageWithData:[request responseData]] scaleToSize:CGSizeMake(68, 55)];
    shopImage = [[UIImageView alloc] initWithImage:image];
    shopImage.alpha = 0;
    [self.view addSubview:shopImage];
    shopImage.center = CGPointMake(background.frame.size.width / 2, background.frame.size.height / 2 - 1);
    [indicatorView stopAnimating];
    [indicatorView removeFromSuperview];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    shopImage.alpha = 1;
    [UIView commitAnimations];
}

- (void)dealloc
{
    NSLog(@"************** ShadowImageViewController dealloc ****************");
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
