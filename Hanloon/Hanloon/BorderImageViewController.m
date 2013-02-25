//
//  BorderImageViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-25.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "BorderImageViewController.h"
#import "ImageData.h"
#import "UIImage+ImageScale.h"
#import "ImageGroupViewController.h"

@interface BorderImageViewController ()

@end

@implementation BorderImageViewController

- (void)dealloc
{
    NSLog(@"******************* BorderImageViewController dealloc ***********************");
    
    [indicatorView release];
    if (conn != nil) {
        if (isLoading) {
            [conn cancel];
        }
        [conn release];
    }
    
    [super dealloc];
}

- (void)showIndicator
{
    isLoading = YES;
    if (indicatorView == nil) {
        indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicatorView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    }
    [indicatorView startAnimating];
    [self.view addSubview:indicatorView];
}

- (void)hideIndicator
{
    isLoading = NO;
    [indicatorView stopAnimating];
    [indicatorView removeFromSuperview];
}

- (void)showBorder
{
    self.view.layer.borderColor = [UIColor redColor].CGColor;
    self.view.layer.borderWidth = 2;
}

- (void)hideBorder
{
    self.view.layer.borderWidth = 0;
}

- (void)showImageByImageData:(ImageData *)data parent:(ImageGroupViewController *)controller
{
    parentController = controller;
    imageData = [data retain];
    if (data.thumbImageData) {
        UIImageView* imgView = [[UIImageView alloc] initWithImage:data.thumbImageData];
        [imgView setFrame:CGRectMake(10, 10, data.thumbImageData.size.width, data.thumbImageData.size.height)];
        [self.view addSubview:imgView];
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTaped:)];
        [self.view addGestureRecognizer:tap];
        [tap release];
    }else{
        [self showIndicator];
        [self performSelectorInBackground:@selector(loadImage) withObject:nil];
    }
}

- (void)loadImage
{
    if (conn != nil) {
        [conn release];
    }
    NSURL* url = [NSURL URLWithString: imageData.thumbImage];
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (conn) {
        [conn start];
    }
    CFRunLoopRun();
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)d
{
    if(mutableData == nil){
        mutableData = [[NSMutableData alloc] initWithData:d];
        return;
    }
    [mutableData appendData:d];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    CFRunLoopStop(CFRunLoopGetCurrent());
    [self performSelectorOnMainThread:@selector(loadComplete) withObject:nil waitUntilDone:YES];
}

- (void)loadComplete
{
    UIImage* img = [UIImage imageWithData:mutableData];
    img = [img scaleToSize:CGSizeMake(self.view.frame.size.width - 20, self.view.frame.size.height - 20)];
    [imageData thumbImageData:img];
    [self hideIndicator];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:img];
    [imageView setFrame:CGRectMake(10, 10, img.size.width, img.size.height)];
    [self.view addSubview:imageView];
    [imageView release];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTaped:)];
    [self.view addGestureRecognizer:tap];
    [tap release];
    
    [conn release];
    conn = nil;
}

- (void)viewTaped:(UITapGestureRecognizer*)tap
{
    [parentController showOriginImageFromBorderImage:imageData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
