//
//  OriginImageViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-25.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "OriginImageViewController.h"
#import "ImageData.h"
#import "Definitions.h"
#import "ImageGroupViewController.h"

@interface OriginImageViewController ()

@end

@implementation OriginImageViewController

- (void)dealloc
{
    NSLog(@"*********************** OriginImageViewController dealloc ********************************");
    
    [indicatorView release];
    [imageView release];
    [imageScrollView release];
    [originImageData release];
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
        indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
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

- (void)loadImageWithImageData:(ImageData *)imageData parent:(ImageGroupViewController *)controller isFull:(BOOL)full
{
    isFull = full;
    parentController = controller;
    data = imageData;
    if (data.originImageData) {
        if(originImageData == nil){
            originImageData = [[NSMutableData alloc] initWithCapacity:0];
        }
        [originImageData appendData:UIImagePNGRepresentation(data.originImageData)];
        [self loadComplete];
        return;
    }
    [self showIndicator];
    [self performSelectorInBackground:@selector(loadImage) withObject:nil];
}

- (void)loadImage
{
    if (conn != nil) {
        [conn release];
    }
    NSURL* url = [NSURL URLWithString: data.originImage];
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (conn) {
        [conn start];
    }
    CFRunLoopRun();
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)d
{
    if(originImageData == nil){
        originImageData = [[NSMutableData alloc] initWithData:d];
        return;
    }
    [originImageData appendData:d];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    CFRunLoopStop(CFRunLoopGetCurrent());
    [self performSelectorOnMainThread:@selector(loadComplete) withObject:nil waitUntilDone:YES];
}

- (void)loadComplete
{
    UIImage* img = [UIImage imageWithData:originImageData];
    [data originImageData:img];
    
    if (imageScrollView == nil) {
        imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT - 100)];
        [imageScrollView setContentSize:CGSizeMake(FULL_WIDTH, FULL_HEIGHT - 100)];
        imageScrollView.maximumZoomScale = 1.0;
        imageScrollView.minimumZoomScale = 1.0;
        imageScrollView.zoomScale = 1.0;
        imageScrollView.delegate = self;
    }
    
    imageView = [[UIImageView alloc] initWithImage:img];
    imageView.contentMode = UIViewContentModeCenter;
    [imageView setFrame:CGRectMake((FULL_WIDTH - img.size.width) / 2, (FULL_HEIGHT - 100 - img.size.height) / 2, img.size.width, img.size.height)];
    [self hideIndicator];
    
    float x_scale = FULL_WIDTH / img.size.width;
    float y_scale = (FULL_HEIGHT - 100) / img.size.height;
    CGFloat scale = x_scale < y_scale ? x_scale : y_scale;
    imageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    [imageScrollView addSubview:imageView];
    [self.view addSubview:imageScrollView];
    
    if (isFull) {
        [self changeToFull: isFull];
    }
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTaped:)];
    [imageScrollView addGestureRecognizer:tap];
    [tap release];
}

- (void)scrollViewTaped:(UITapGestureRecognizer*)tap
{
    [self changeToFull: !isFull];
}

- (void)changeToFull:(BOOL)full
{
    isFull = full;
    if (!isFull) {
        imageScrollView.maximumZoomScale = 1.0;
        imageScrollView.minimumZoomScale = 1.0;
        imageScrollView.zoomScale = 1.0;
        float x_scale = FULL_WIDTH / imageView.frame.size.width;
        float y_scale = (FULL_HEIGHT - 100) / imageView.frame.size.height;
        CGFloat scale = x_scale < y_scale ? x_scale : y_scale;
        imageView.transform = CGAffineTransformMakeScale(scale, scale);
        
        [imageView setFrame:CGRectMake((FULL_WIDTH - imageView.frame.size.width) / 2, 5, imageView.frame.size.width, imageView.frame.size.height)];
        [imageScrollView setContentSize:CGSizeMake(FULL_WIDTH, FULL_HEIGHT - 100)];
        
        [parentController exitGroupView];
    }else{
        imageScrollView.maximumZoomScale = 2.0;
        imageScrollView.minimumZoomScale = 0.5;
        imageScrollView.zoomScale = 1.0;
        [imageScrollView setFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
        
        CGFloat xcenter = imageScrollView.frame.size.width / 2, ycenter = imageScrollView.frame.size.height / 2;
        
        xcenter = imageScrollView.contentSize.width > imageScrollView.frame.size.width ? imageScrollView.contentSize.width / 2 : xcenter;
        ycenter = imageScrollView.contentSize.height > imageScrollView.frame.size.height ? imageScrollView.contentSize.height / 2 : ycenter;
        
        imageView.center = CGPointMake(xcenter, ycenter);
        [parentController fullGroupView];
    }
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    CGFloat xcenter = imageScrollView.frame.size.width / 2, ycenter = imageScrollView.frame.size.height / 2;
    
    xcenter = imageScrollView.contentSize.width > imageScrollView.frame.size.width ? imageScrollView.contentSize.width / 2 : xcenter;
    ycenter = imageScrollView.contentSize.height > imageScrollView.frame.size.height ? imageScrollView.contentSize.height / 2 : ycenter;
    
    [imageView setCenter:CGPointMake(xcenter, ycenter)];
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
