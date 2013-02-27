//
//  ShadowImageView.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-25.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "ShadowImageView.h"
#import "UIImage+ImageScale.h"
#import "ImageData.h"
#import "Global.h"
#import "AbelViewController.h"
#import "HLPhotoViewerViewController.h"

@implementation ShadowImageView

@synthesize imageData;
@synthesize parentController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage* img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"imageBK" ofType:@"png"]];
        background = [[UIImageView alloc] initWithImage:img];
        [self addSubview:background];
    }
    return self;
}

- (void)imageData:(ImageData *)data
{
    if (imageData != nil) {
        [imageData release];
    }
    imageData = [data retain];
    
    if (isLoading) {
        return;
    }
    isLoading = YES;
    [self showIndicator];
    [self performSelectorInBackground:@selector(loadImage) withObject:nil];
}

- (void)showIndicator
{
    if (activityIndicator == nil) {
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityIndicator.center = CGPointMake(background.frame.size.width / 2, background.frame.size.height / 2);
        [activityIndicator startAnimating];
    }
    [self addSubview:activityIndicator];
}

- (void)hideIndicator
{
    [activityIndicator stopAnimating];
    [activityIndicator removeFromSuperview];
    [activityIndicator release];
    activityIndicator = nil;
}

- (void)loadImage
{
    if (conn != nil) {
        [conn release];
    }
    NSURL* url = [NSURL URLWithString:imageData.thumbImage];
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (conn) {
        [conn start];
    }
    CFRunLoopRun();
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(imgData == nil){
        imgData = [[NSMutableData alloc] initWithData:data];
        return;
    }
    [imgData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    CFRunLoopStop(CFRunLoopGetCurrent());
    [self performSelectorOnMainThread:@selector(loadComplete) withObject:nil waitUntilDone:YES];
}

- (void)loadComplete
{
    UIImage* img = [UIImage imageWithData:imgData];
    img = [img scaleToSize:CGSizeMake(background.frame.size.width - 20, background.frame.size.height - 20)];
    [imageData thumbImageData:img];
    isLoading = NO;
    [self hideIndicator];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:img];
    imageView.center = CGPointMake(background.frame.size.width / 2, background.frame.size.height / 2);
    [self addSubview:imageView];
    [imageView release];
    [conn release];
    conn = nil;
    [imgData release];
    imgData = nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (isLoading == NO) {
        [parentController showImageGroup:imageData];
    }
}

- (void)dealloc
{
    NSLog(@"********************* ShadowImageView dealloc ***********************");
    
    [imageData release];
    if (imgData != nil) {
        [imgData release];
    }
    if (activityIndicator != nil) {
        [activityIndicator release];
    }
    
    if (conn != nil) {
        if (isLoading) {
            [conn cancel];
        }
        [conn release];
    }
    
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
