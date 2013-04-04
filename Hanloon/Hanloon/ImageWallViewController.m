//
//  ImageWallViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-24.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "ImageWallViewController.h"
#import "Global.h"
#import "ImageData.h"
#import "ShadowImageView.h"
#import "Definitions.h"
#import "HLPhotoViewerViewController.h"

@interface ImageWallViewController ()

@end

@implementation ImageWallViewController

- (void)dealloc
{
    NSLog(@"********************** ImageWallViewController dealloc *****************************");
    
    [background release];
    [hanloonLogo release];
    [shadowImageList removeAllObjects];
    [shadowImageList release];
    shadowImageList = nil;
    [scrollView release];
    [totalNumLabel release];
    parentController = nil;
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setView:(UIView *)view
{
    [super setView:view];
    
    [self initView];
}

- (void)initView
{
    background = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"background" ofType:@"png"]]];
    background.userInteractionEnabled = NO;
    [self.view addSubview:background];
    
    UIImage* logoImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hanloonlogo" ofType:@"png"]];
    hanloonLogo = [[UIImageView alloc] initWithImage:logoImage];
    [hanloonLogo setFrame:CGRectMake((background.frame.size.width - logoImage.size.width) / 2, (background.frame.size.height - logoImage.size.height) / 2, logoImage.size.width, logoImage.size.height)];
    hanloonLogo.userInteractionEnabled = NO;
    [self.view addSubview:hanloonLogo];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    shadowImageList = [[NSMutableArray alloc] initWithCapacity:0];
    
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(imageWallPanGesture:)];
    [self.view addGestureRecognizer:pan];
    [pan release];
}

- (void)imageWallPanGesture:(UIPanGestureRecognizer*)pan
{
    if (self.view.layer.shadowRadius != 8) {
        self.view.layer.shadowColor = [UIColor blackColor].CGColor;
        self.view.layer.shadowOpacity = 0.8;
        self.view.layer.shadowRadius = 8;
        self.view.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.view.frame cornerRadius:0].CGPath;
    }
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

- (void)showImages:(NSMutableArray *)array num:(int)totalNum parent:(HLPhotoViewerViewController *)controller
{
    parentController = controller;
    hanloonLogo.hidden = YES;
    if (shadowImageList != nil && [shadowImageList count] > 0) {
        for (ShadowImageView* v in shadowImageList) {
            [v removeFromSuperview];
        }
        [shadowImageList removeAllObjects];
    }
    float cellWidth = 184;
    float cellHeight = 134;
    int totalHeight = 0;
    for (ImageData* data in array) {
        int num = [shadowImageList count];
        int row = num / 5;
        int column = num % 5;
        ShadowImageView* shadowImageView = [[ShadowImageView alloc] initWithFrame:CGRectMake(column * (cellWidth + 20) + 10, row * (cellHeight + 20) + 10, cellWidth, cellHeight)];
        totalHeight = row * (cellHeight + 20) + 10;
        [shadowImageView imageData:data];
        [shadowImageView parentController:parentController];
        [scrollView addSubview:shadowImageView];
        scrollView.tag = num;
        [shadowImageList addObject:shadowImageView];
        [shadowImageView release];
    }
    if (totalHeight == 0) {
        totalHeight = 60;
    }else{
        totalHeight = totalHeight + cellHeight + 60;
    }
    [scrollView setContentSize:CGSizeMake(FULL_WIDTH, totalHeight)];
    [scrollView setContentOffset:CGPointMake(0, 0)];
    [self showTotalNumLabel];
}

- (void)showTotalNumLabel
{
    if (totalNumLabel == nil) {
        totalNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, scrollView.contentSize.height - 50, FULL_WIDTH, 30)];
        totalNumLabel.textAlignment = NSTextAlignmentCenter;
        [totalNumLabel setFont:[UIFont systemFontOfSize:18.0]];
        [totalNumLabel setTextColor:[UIColor whiteColor]];
        totalNumLabel.backgroundColor = [UIColor clearColor];
    }
    [totalNumLabel setFrame:CGRectMake(0, scrollView.contentSize.height - 50, FULL_WIDTH, 30)];
    [totalNumLabel setText:[NSString stringWithFormat:@"共找到%d张图片", [parentController totalNum]]];
    [scrollView addSubview:totalNumLabel];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)sv
{
    if (sv.contentOffset.y + sv.frame.size.height >= sv.contentSize.height) {
        [parentController loadNextPage];
    }
}

- (void)addImage:(int)addedNum
{
    float cellWidth = 184;
    float cellHeight = 134;
    int totalHeight = 0;
    int curTotalNum = [[parentController imageDataList] count];
    int startIndex = curTotalNum - addedNum;
    for (int i = startIndex; i < curTotalNum; i++) {
        ImageData* data = [[parentController imageDataList] objectAtIndex:i];
        int num = [shadowImageList count];
        int row = num / 5;
        int column = num % 5;
        ShadowImageView* shadowImageView = [[ShadowImageView alloc] initWithFrame:CGRectMake(column * (cellWidth + 20) + 10, row * (cellHeight + 20) + 10, cellWidth, cellHeight)];
        totalHeight = row * (cellHeight + 20) + 10;
        [shadowImageView imageData:data];
        [shadowImageView parentController:parentController];
        [scrollView addSubview:shadowImageView];
        scrollView.tag = num;
        [shadowImageList addObject:shadowImageView];
        [shadowImageView release];
    }
    totalHeight = totalHeight + cellHeight + 60;
    [scrollView setContentSize:CGSizeMake(FULL_WIDTH, totalHeight)];
    [self showTotalNumLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
