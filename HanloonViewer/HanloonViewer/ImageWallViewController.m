//
//  ImageWallViewController.m
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-13.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "ImageWallViewController.h"
#import "ImageDownloadData.h"
#import "Global.h"
#import "ShadowViewController.h"
#import "Loader.h"
#import "UIImage+ImageScale.h"
#import "HanloonViewerMainViewController.h"

@implementation ImageWallViewController

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setView:(UIView *)view
{
    [super setView:view];
    
    [self initTableView];
    
    self.view.layer.shadowRadius = 5.0;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.view.layer.shadowOpacity = 0.8;
}

- (void)showImages
{
    for (ShadowViewController* sv in imageList) {
        [sv.view removeFromSuperview];
        [sv release];
    }
    [imageList removeAllObjects];
    
    float fullWidth = self.view.frame.size.width;
    [scrollView setContentSize:CGSizeMake(fullWidth, 0)];
    int row = ([[[Global sharedGlobal] curData] count] + 4) / 5;
    float cellWidth = 185;
    float cellHeight = 150;
    for (int i = 0; i < row; i++) {
        for (int j = i * 5; j < i * 5 + 5; j++) {
            if ([[[Global sharedGlobal] curData] count] > j) {
                ImageDownloadData* downloadData = [[[Global sharedGlobal] curData] objectAtIndex:j];
                UIView* view = [[UIView alloc] initWithFrame:CGRectMake((j % 5) * (cellWidth + 20) + 10, i * (cellHeight + 10) + 10, cellWidth, cellHeight)];
                view.backgroundColor = [UIColor whiteColor];
                ShadowViewController* shadowView = [[ShadowViewController alloc] init];
                [shadowView setView:view];
                [view release];
                shadowView.contentsGravity = kCAGravityCenter;
                shadowView.shadowColor = [UIColor blackColor];
                shadowView.shadowOpacity = 0.8;
                shadowView.shadowOffset = CGSizeMake(1, 1);
                shadowView.shadowRadius = 1.0;
                [scrollView addSubview:shadowView.view];
                downloadData.tag = j;
                downloadData.delegate = self;
                [shadowView imageData:downloadData];
                [[Loader sharedLoader] addImage:downloadData];
                [[Loader sharedLoader] startLoad];
                [imageList addObject:shadowView];
            }
        }
    }
    [self resetContentSize];
}

- (void)addImages:(int)num
{
    float cellWidth = 185;
    float cellHeight = 150;
    
    int row0 = ([[[Global sharedGlobal] curData] count] + 4) / 5;
    int row1 = (num + 4) / 5;
    int lastRow = row0 - row1;
    for (int i = lastRow; i < row0; i++) {
        for (int j = i * 5; j < i * 5 + 5; j++) {
            if ([[[Global sharedGlobal] curData] count] > j) {
                ImageDownloadData* downloadData = [[[Global sharedGlobal] curData] objectAtIndex:j];
                UIView* view = [[UIView alloc] initWithFrame:CGRectMake((j % 5) * (cellWidth + 20) + 10, i * (cellHeight + 10) + 10, cellWidth, cellHeight)];
                view.backgroundColor = [UIColor whiteColor];
                ShadowViewController* shadowView = [[ShadowViewController alloc] init];
                [shadowView setView:view];
                [view release];
                shadowView.contentsGravity = kCAGravityCenter;
                shadowView.shadowColor = [UIColor blackColor];
                shadowView.shadowOpacity = 0.8;
                shadowView.shadowOffset = CGSizeMake(1, 1);
                shadowView.shadowRadius = 1.0;
                [scrollView addSubview:shadowView.view];
                downloadData.tag = j;
                downloadData.delegate = self;
                [shadowView imageData:downloadData];
                [[Loader sharedLoader] addImage:downloadData];
                [[Loader sharedLoader] startLoad];
                [imageList addObject:shadowView];
            }
        }
    }
    [self resetContentSize];
}

- (void)resetContentSize
{
    float fullWidth = self.view.frame.size.width;
    int row = ([[[Global sharedGlobal] curData] count] + 4) / 5;
    float cellHeight = 150;
    [scrollView setContentSize:CGSizeMake(fullWidth, row * (cellHeight + 10) + 80)];
    [self showFootLabel];
}

- (void) initTableView
{
    float fullWidth = self.view.frame.size.width;
    float fullHeight = self.view.frame.size.height;
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, fullWidth, fullHeight)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.delegate = self;
    scrollView.scrollEnabled = YES;
    [self.view addSubview:scrollView];
    
    imageList = [[NSMutableArray alloc] initWithCapacity:0];
    
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewPan:)];
    [self.view addGestureRecognizer:pan];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)sv
{
    if (scrollView.contentOffset.y == scrollView.contentSize.height - scrollView.frame.size.height) {
        if ([[[Global sharedGlobal] curData] count] < [[Global sharedGlobal] totalNum]) {
            [footLabel setText:[NSString stringWithFormat:@"正在加载..."]];
            [[[Global sharedGlobal] app] getNextPage];
        }
    }
}

- (void)scrollViewPan:(UIPanGestureRecognizer*)pan
{
    CGPoint p = [pan translationInView:self.view];
    if (pan.state == UIGestureRecognizerStateEnded) {
        preDis = 0;
        if (self.view.frame.origin.x > 100) {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.3];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [self.view setFrame:CGRectMake(200, 0, self.view.frame.size.width, self.view.frame.size.height)];
            [UIView commitAnimations];
        }else{
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.3];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            [UIView commitAnimations];
        }
        return;
    }
    if (p.x > 0) {
        if (self.view.frame.origin.x < 200) {
            [self.view setFrame:CGRectMake(self.view.frame.origin.x + p.x - preDis, 0, self.view.frame.size.width, self.view.frame.size.height)];
            preDis = p.x;
        }else{
            [self.view setFrame:CGRectMake(200, 0, self.view.frame.size.width, self.view.frame.size.height)];
        }
    }else{
        if (self.view.frame.origin.x > 0) {
            [self.view setFrame:CGRectMake(self.view.frame.origin.x + (p.x - preDis), 0, self.view.frame.size.width, self.view.frame.size.height)];
            preDis = p.x;
        }else{
            [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        }
    }
}

- (void)showFootLabel
{
    float fullWidth = self.view.frame.size.width;
    if (footLabel == nil) {
        footLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, scrollView.contentSize.height - 40, fullWidth, 30)];
        footLabel.textAlignment = NSTextAlignmentCenter;
        footLabel.backgroundColor = [UIColor clearColor];
    }
    [footLabel setFrame:CGRectMake(0, scrollView.contentSize.height - 40, fullWidth, 30)];
    [footLabel setText:[NSString stringWithFormat:@"共找到%d张图片", [[Global sharedGlobal] totalNum]]];
    [scrollView addSubview:footLabel];
}

- (void)showImagesUnadded:(ImageDownloadData *)data
{
    [self downloadComplete:data];
}

- (void)downloadComplete:(ImageDownloadData *)data
{
    ShadowViewController* shadowView = [imageList objectAtIndex:data.tag];
    data.image = [data.image scaleToSize:CGSizeMake(175, 140)];
    shadowView.contents = (id)data.image.CGImage;
}

- (void)dealloc
{
    [super dealloc];
}

@end
