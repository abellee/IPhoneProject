//
//  ImageGroupViewController.m
//  HanloonViewer
//
//  Created by Lee Abel on 13-2-16.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "ImageGroupViewController.h"
#import "ImageDownloadData.h"
#import "Global.h"
#import "HanloonViewerMainViewController.h"
#import "ShadowViewController.h"
#import "Loader.h"
#import "UIImage+ImageScale.h"
#import "LoadingView.h"

@implementation ImageGroupViewController

- (void)setView:(UIView *)view
{
    [super setView:view];
    [self initInterface];
}

- (void)initInterface
{
    horizontalView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width - 100)];
    horizontalView.pagingEnabled = YES;
    horizontalView.contentSize = CGSizeMake([[[Global sharedGlobal] curData] count] * [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width - 100);
    horizontalView.delegate = self;
    horizontalView.tag = 0;
    [self.view addSubview:horizontalView];
    
    leftBack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, [[UIScreen mainScreen] bounds].size.width)];
    leftBack.backgroundColor = [UIColor blackColor];
    leftBack.alpha = 0.5;
    [self.view addSubview:leftBack];
    
    rightBack = [[UIView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.height - 150, 0, 150, [[UIScreen mainScreen] bounds].size.width)];
    rightBack.backgroundColor = [UIColor blackColor];
    rightBack.alpha = 0.5;
    [self.view addSubview:rightBack];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 50, 200, 30)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:titleLabel];
    
    countLabel = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.height - 300, 50, 100, 30)];
    countLabel.textAlignment = NSTextAlignmentRight;
    countLabel.backgroundColor = [UIColor clearColor];
    countLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:countLabel];
    
    closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    [closeButton setFrame:CGRectMake(20, 20, 40, 40)];
    [closeButton addTarget:self action:@selector(closeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
    
//    saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
//    [saveButton setFrame:CGRectMake(20, 80, 40, 40)];
//    [saveButton addTarget:self action:@selector(saveButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:saveButton];
    
    addImageData = [[NSMutableArray alloc] initWithCapacity:0];
    thumbImageList = [[NSMutableArray alloc] initWithCapacity:0];
    
    verticalView = [[UIScrollView alloc] initWithFrame:CGRectMake(rightBack.frame.origin.x + 5, rightBack.frame.origin.y + 10, rightBack.frame.size.width - 10, rightBack.frame.size.height - 20)];
    verticalView.showsHorizontalScrollIndicator = NO;
    verticalView.showsVerticalScrollIndicator = NO;
    verticalView.tag = 1;
    verticalView.delegate = self;
    [self.view addSubview:verticalView];

    int row = [[[Global sharedGlobal] curData] count];
    float cellWidth = 140;
    float cellHeight = 100;
    for (int i = 0; i < row; i++) {
        if ([[[Global sharedGlobal] curData] count] > i) {
            ImageDownloadData* downloadData = [[[Global sharedGlobal] curData] objectAtIndex:i];
            UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, i * (cellHeight + 10), cellWidth, cellHeight)];
            view.backgroundColor = [UIColor whiteColor];
            ShadowViewController* shadowView = [[ShadowViewController alloc] init];
            [shadowView setView:view];
            [view release];
            shadowView.contentsGravity = kCAGravityCenter;
            [verticalView addSubview:shadowView.view];
            downloadData.tag = i;
            downloadData.delegate = self;
            [shadowView imageData:downloadData];
            if (downloadData.image) {
                shadowView.contents = (id)downloadData.image.CGImage;
            }else{
                [[Loader sharedLoader] addImage:downloadData];
                [[Loader sharedLoader] startLoad];
            }
            [thumbImageList addObject:shadowView];
            [shadowView release];
        }
    }
    [verticalView setContentSize:CGSizeMake(rightBack.frame.size.width - 10, row * cellHeight + row * 10 + 10)];
}

- (void)downloadComplete:(ImageDownloadData *)data
{
    ShadowViewController* shadowView = [thumbImageList objectAtIndex:data.tag];
    data.image = [data.image scaleToSize:CGSizeMake(175, 140)];
    shadowView.contents = (id)data.image.CGImage;
    [[[Global sharedGlobal] app] showImageInWall:data];
}

- (void)closeButtonPressed:(id)sender
{
    for (ImageDownloadData* downloadData in [[Global sharedGlobal] curData]) {
        downloadData.delegate = nil;
    }
    [[[Global sharedGlobal] app] cancelGroupView];
}

- (void)showImageWithDownloadData:(ImageDownloadData*)data
{
    [countLabel setText:[NSString stringWithFormat:@"%d / %d", data.tag + 1, [[Global sharedGlobal] totalNum]]];
    [titleLabel setText:data.title];
    [horizontalView setContentOffset:CGPointMake(data.tag * horizontalView.frame.size.width, 0) animated:YES];
    [self changeVerticalView:data];
    curData = data;
    if (loadingView == nil) {
        loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [loadingView setFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.height - 40) / 2, ([[UIScreen mainScreen] bounds].size.width - 40) / 2, 40, 40)];
    }
    [loadingView startAnimating];
    [self.view addSubview:loadingView];
    [self loadOriginImage];
}

- (void)showOrHide:(BOOL)bo
{
    closeButton.hidden = bo;
    verticalView.hidden = bo;
    leftBack.hidden = bo;
    rightBack.hidden = bo;
    titleLabel.hidden = bo;
    countLabel.hidden = bo;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        if(verticalView.contentOffset.y + verticalView.frame.size.height == verticalView.contentSize.height)
        {
            if ([[Global sharedGlobal] totalNum] - [[[Global sharedGlobal] curData] count] > 0)
            {
                [self showLoadingView];
                [[[Global sharedGlobal] app] getNextPage];
            }
            return;
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        if(verticalView.contentOffset.y + verticalView.frame.size.height == verticalView.contentSize.height)
        {
            if ([[Global sharedGlobal] totalNum] - [[[Global sharedGlobal] curData] count] > 0)
            {
                [self showLoadingView];
                [[[Global sharedGlobal] app] getNextPage];
            }
            return;
        }
    }
    if (scrollView.tag == 0) {
        [self showOriginImageInScrollView];
    }
}

- (void)addAditionalImage:(int)num
{
    [self hideLoadingView];
    int numNeedAdd = num;
    int widthNeedAdd = numNeedAdd * [[UIScreen mainScreen] bounds].size.height;
    int hwidthNow = horizontalView.contentSize.width;
    int hheightNow = horizontalView.contentSize.height;
    horizontalView.contentSize = CGSizeMake(widthNeedAdd + hwidthNow, hheightNow);
    
    int row = [[[Global sharedGlobal] curData] count] - num;
    float cellWidth = 140;
    float cellHeight = 100;
    for (int i = row; i < [[[Global sharedGlobal] curData] count]; i++) {
        if ([[[Global sharedGlobal] curData] count] > i) {
            ImageDownloadData* downloadData = [[[Global sharedGlobal] curData] objectAtIndex:i];
            UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, i * (cellHeight + 10), cellWidth, cellHeight)];
            view.backgroundColor = [UIColor whiteColor];
            ShadowViewController* shadowView = [[ShadowViewController alloc] init];
            [shadowView setView:view];
            [view release];
            shadowView.contentsGravity = kCAGravityCenter;
            [verticalView addSubview:shadowView.view];
            downloadData.tag = i;
            downloadData.delegate = self;
            [shadowView imageData:downloadData];
            if (downloadData.image) {
                shadowView.contents = (id)downloadData.image.CGImage;
            }else{
                [[Loader sharedLoader] addImage:downloadData];
                [[Loader sharedLoader] startLoad];
            }
            [thumbImageList addObject:shadowView];
            [shadowView release];
        }
    }
    [verticalView setContentSize:CGSizeMake(rightBack.frame.size.width - 10, [[[Global sharedGlobal] curData] count] * cellHeight + [[[Global sharedGlobal] curData] count] * 10 + 10)];
}

- (void)showOriginImageInScrollView
{
    CGPoint offset = [horizontalView contentOffset];
    int index = (int)(offset.x / horizontalView.frame.size.width);
    if (index >= [[[Global sharedGlobal] curData] count]) {
        return;
    }
    ImageDownloadData* data = [[[Global sharedGlobal] curData] objectAtIndex:index];
    [self changeVerticalView:data];
    if ([addImageData containsObject:data]) {
        [imageData setLength:0];
        [imageData appendData:UIImagePNGRepresentation(data.originImage)];
        curData = data;
        [self addImage];
        return;
    }
    [self showImageWithDownloadData:data];
}

- (void)changeVerticalView:(ImageDownloadData*)data
{
    if (lastShadowView != nil) {
        lastShadowView.borderWidth = 0;
    }
    if (data.tag * 110 < verticalView.contentSize.height - verticalView.frame.size.height) {
        [verticalView setContentOffset:CGPointMake(0, data.tag * 110) animated:YES];
    }else{
        [verticalView setContentOffset:CGPointMake(0, verticalView.contentSize.height - verticalView.frame.size.height) animated:YES];
    }
    ShadowViewController* shadowView = [thumbImageList objectAtIndex:data.tag];
    shadowView.borderColor = [UIColor redColor];
    shadowView.borderWidth = 2;
    lastShadowView = shadowView;
}

- (void)loadOriginImage
{
    NSURL* url = [curData origin];
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn){
        [conn start];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)rd
{
    if(!imageData){
        imageData = [[NSMutableData alloc] initWithData:rd];
        return;
    }
    [imageData appendData:rd];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [conn release];
    conn = nil;
    [loadingView stopAnimating];
    [loadingView removeFromSuperview];
    [self addImage];
}

- (void)addImage
{
    [addImageData addObject:curData];
    UIImage* img = [UIImage imageWithData:imageData];
    curData.originImage = [[UIImage imageWithData:imageData] retain];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:img];
    imageView.contentMode = UIViewContentModeCenter;
    
    if(curView == nil){
        curView = [[UIScrollView alloc] initWithFrame:CGRectMake(horizontalView.frame.size.width * curData.tag, 0, horizontalView.frame.size.width, horizontalView.frame.size.height)];
        curView.tag = 5;
        curView.delegate = self;
    }else{
        for (UIView* subView in curView.subviews) {
            [subView removeFromSuperview];
        }
    }
    curView.contentSize = horizontalView.frame.size;
    [curView setFrame:CGRectMake(horizontalView.frame.size.width * curData.tag, 0, horizontalView.frame.size.width, horizontalView.frame.size.height)];
    curView.backgroundColor = [UIColor clearColor];
    curView.zoomScale = 1;
    [imageView setFrame:CGRectMake((curView.frame.size.width - imageView.frame.size.width) / 2, (curView.frame.size.height - imageView.frame.size.height) / 2, imageView.frame.size.width, imageView.frame.size.height)];
    
    float x_scale = horizontalView.frame.size.width / img.size.width;
    float y_scale = horizontalView.frame.size.height / img.size.height;
    CGFloat scale = x_scale < y_scale ? x_scale : y_scale;
    imageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    [curView addSubview:imageView];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOrigin:)];
    [curView addGestureRecognizer:tap];
    [tap release];
    [horizontalView addSubview:curView];
    [imageData setLength:0];
    [imageView release];
}

- (void)showOrigin:(UITapGestureRecognizer*)tap
{
    [horizontalView setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width)];
    [curView setFrame:CGRectMake(horizontalView.frame.size.width * curData.tag, 0, horizontalView.frame.size.width, horizontalView.frame.size.height)];
    curView.minimumZoomScale = 1;
    curView.maximumZoomScale = 2.0;
    curView.zoomScale = 1.0;
    curView.contentSize = horizontalView.frame.size;
    
    if ([[curView subviews] count] > 0) {
        UIImageView* imageView = [[curView subviews] objectAtIndex:0];
        [imageView setFrame:CGRectMake((curView.frame.size.width - curData.originImage.size.width) / 2, (curView.frame.size.height - curData.originImage.size.height) / 2, curData.originImage.size.width, curData.originImage.size.height)];
        
        float x_scale = horizontalView.frame.size.width / curData.originImage.size.width;
        float y_scale = horizontalView.frame.size.height / curData.originImage.size.height;
        CGFloat scale = x_scale < y_scale ? x_scale : y_scale;
        imageView.transform = CGAffineTransformMakeScale(scale, scale);
        [self showOrHide:YES];
        UITapGestureRecognizer* tapp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideOrigin:)];
        [curView addGestureRecognizer:tapp];
        [tapp release];
    }
}

- (void)hideOrigin:(UITapGestureRecognizer*)tap
{
    [self showOrHide:NO];
    [horizontalView setFrame:CGRectMake(0, 100, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width - 100)];
    horizontalView.contentSize = CGSizeMake([[Global sharedGlobal] totalNum] * [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width - 100);
    curView.contentSize = horizontalView.frame.size;
    [curView setFrame:CGRectMake(horizontalView.frame.size.width * curData.tag, 0, horizontalView.frame.size.width, horizontalView.frame.size.height)];
    curView.minimumZoomScale = 1;
    curView.maximumZoomScale = 1;
    curView.zoomScale = 1.0;
    if ([[curView subviews] count] > 0) {
        UIImageView* imageView = [[curView subviews] objectAtIndex:0];
        [imageView setFrame:CGRectMake((curView.frame.size.width - curData.originImage.size.width) / 2, (curView.frame.size.height - curData.originImage.size.height) / 2, curData.originImage.size.width, curData.originImage.size.height)];
        
        float x_scale = horizontalView.frame.size.width / imageView.frame.size.width;
        float y_scale = horizontalView.frame.size.height / imageView.frame.size.height;
        CGFloat scale = x_scale < y_scale ? x_scale : y_scale;
        imageView.transform = CGAffineTransformMakeScale(scale, scale);
        UITapGestureRecognizer* tapp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOrigin:)];
        [curView addGestureRecognizer:tapp];
        [tapp release];
    }
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    CGFloat xcenter = curView.frame.size.width / 2, ycenter = curView.frame.size.height / 2;
    
    xcenter = curView.contentSize.width > curView.frame.size.width ? curView.contentSize.width / 2 : xcenter;
    ycenter = curView.contentSize.height > curView.frame.size.height ? curView.contentSize.height / 2 : ycenter;

    if ([[curView subviews] count] > 0) {
        UIImageView* imageView = [[curView subviews] objectAtIndex:0];
        [imageView setCenter:CGPointMake(xcenter, ycenter)];
    }
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if ([[curView subviews] count] > 0) {
        return [[curView subviews] objectAtIndex:0];
    }
    return NULL;
}

- (void)hideLoadingView
{
    [self.view setUserInteractionEnabled:YES];
    [loadingViewBack removeFromSuperview];
}

- (void)showLoadingView
{
    [self.view setUserInteractionEnabled:NO];
    if (loadingViewBack == nil) {
        loadingViewBack = [[LoadingView alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.height - 80) / 2, ([[UIScreen mainScreen] bounds].size.width - 80) / 2, 80, 80)];
    }
    [self.view addSubview:loadingViewBack];
}

- (void)dealloc
{
    NSLog(@"******************* ImageGroupViewController dealloc *******************");
    if (conn != nil) {
        [conn cancel];
        [conn release];
    }
    if (loadingView != nil) {
        [loadingView release];
    }
    if (imageData != nil) {
        [imageData release];
    }
    if(addImageData != nil){
        [addImageData removeAllObjects];
        [addImageData release];
    }
    if (thumbImageList != nil) {
        [thumbImageList removeAllObjects];
        [thumbImageList release];
    }
    if (curView != nil) {
        [curView release];
    }
    lastShadowView = nil;
    curData = nil;
    [horizontalView release];
    [verticalView release];
    [titleLabel release];
    [countLabel release];
    [leftBack release];
    [rightBack release];
    if (loadingViewBack != nil) {
        [loadingViewBack release];
    }
    [super dealloc];
}

@end
