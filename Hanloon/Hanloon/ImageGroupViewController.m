//
//  ImageGroupViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-25.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "ImageGroupViewController.h"
#import "HLPhotoViewerViewController.h"
#import "ImageData.h"
#import "Definitions.h"
#import "OriginImageViewController.h"
#import "BorderImageViewController.h"

@interface ImageGroupViewController ()

@end

@implementation ImageGroupViewController

- (void)dealloc
{
    NSLog(@"************************ ImageGroupViewController dealloc ****************************");
    
    [originImageScrollView release];
    [leftDock release];
    [closeButton release];
    [rightDock release];
    [thumbImageScrollView release];
    [numLabel release];
    [thumbImageList removeAllObjects];
    [thumbImageList release];
    
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
    originImageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, FULL_WIDTH, FULL_HEIGHT - 100)];
    originImageScrollView.pagingEnabled = YES;
    originImageScrollView.showsVerticalScrollIndicator = NO;
    originImageScrollView.showsHorizontalScrollIndicator = NO;
    originImageScrollView.tag = 0;
    originImageScrollView.delegate = self;
    [self.view addSubview:originImageScrollView];
    
    leftDock = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, FULL_HEIGHT)];
    leftDock.backgroundColor = [UIColor blackColor];
    leftDock.alpha = 0.5;
    [self.view addSubview:leftDock];
    
    UIImage* closeButtonSkin = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"closeButton" ofType:@"png"]];
    closeButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 47, 48)];
    [closeButton setBackgroundImage:closeButtonSkin forState:UIControlStateNormal];
    [closeButton setBackgroundImage:closeButtonSkin forState:UIControlStateHighlighted];
    [self.view addSubview:closeButton];
    [closeButton addTarget:self action:@selector(closeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    rightDock = [[UIView alloc] initWithFrame:CGRectMake(FULL_WIDTH - 200, 0, 200, FULL_HEIGHT)];
    rightDock.backgroundColor = [UIColor blackColor];
    rightDock.alpha = 0.5;
    [self.view addSubview:rightDock];
    
    thumbImageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(rightDock.frame.origin.x + 8, 10, 200, FULL_HEIGHT - 40)];
    thumbImageScrollView.showsVerticalScrollIndicator = NO;
    thumbImageScrollView.showsHorizontalScrollIndicator = NO;
    thumbImageScrollView.tag = 1;
    thumbImageScrollView.delegate = self;
    [self.view addSubview:thumbImageScrollView];
    
    numLabel = [[UILabel alloc] initWithFrame:CGRectMake(FULL_WIDTH - 350, 50, 100, 30)];
    [numLabel setText:@"0/0"];
    [numLabel setTextAlignment:NSTextAlignmentRight];
    [numLabel setTextColor:[UIColor whiteColor]];
    numLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:numLabel];
    
    thumbImageList = [[NSMutableArray alloc] initWithCapacity:0];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 0) {
        int index = [scrollView contentOffset].x / FULL_WIDTH;
        ImageData* imageData = [[parentController imageDataList] objectAtIndex:index];
        [self showOriginImageByImageData:imageData parent:parentController];
        if ([scrollView contentOffset].x + FULL_WIDTH >= scrollView.contentSize.width) {
            [parentController loadNextPage];
        }
    }else if(scrollView.tag == 1){
        if ([scrollView contentOffset].y + FULL_HEIGHT - 40 >= scrollView.contentSize.height) {
            [parentController loadNextPage];
        }
    }
}

- (void)nextPageLoaded:(int)num
{
    [originImageScrollView setContentSize:CGSizeMake([[parentController imageDataList] count] * FULL_WIDTH, FULL_HEIGHT - 100)];
    int totalNum = [[parentController imageDataList] count];
    float cellWidth = 184;
    float cellHeight = 134;
    for (int i = totalNum - num; i < totalNum; i++) {
        ImageData* imgData = [[parentController imageDataList] objectAtIndex:i];
        BorderImageViewController* borderImageViewController = [[BorderImageViewController alloc] init];
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, [thumbImageList count] * (cellHeight + 10) + 10, cellWidth, cellHeight)];
        view.backgroundColor = [UIColor whiteColor];
        [borderImageViewController setView:view];
        [view release];
        [borderImageViewController showImageByImageData:imgData parent:self];
        [thumbImageList addObject:borderImageViewController];
        [thumbImageScrollView addSubview:borderImageViewController.view];
        [borderImageViewController release];
    }
    float totalHeight = [thumbImageList count] * (cellHeight + 10);
    [thumbImageScrollView setContentSize:CGSizeMake(200, totalHeight)];
}

- (void)fullGroupView
{
    [originImageScrollView setFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
    [self hideDocks];
}

- (void)hideDocks
{
    closeButton.hidden = YES;
    leftDock.hidden = YES;
    rightDock.hidden = YES;
    thumbImageScrollView.hidden = YES;
    numLabel.hidden = YES;
}

- (void)showDocks
{
    closeButton.hidden = NO;
    leftDock.hidden = NO;
    rightDock.hidden = NO;
    thumbImageScrollView.hidden = NO;
    numLabel.hidden = NO;
}

- (void)exitGroupView
{
    [originImageScrollView setFrame:CGRectMake(0, 100, FULL_WIDTH, FULL_HEIGHT - 100)];
    [self showDocks];
}

- (void)closeButtonPressed:(id)sender
{
    [parentController removeImageGroup];
}

- (void)setNumLabel:(int)index
{
    [numLabel setText:[NSString stringWithFormat:@"%d/%d", index + 1, [parentController totalNum]]];
    [self showThumbBorder:index];
}

- (void)showThumbBorder:(int)index
{
    if (preBorderImageView != nil) {
        [preBorderImageView hideBorder];
    }
    BorderImageViewController* borderImageViewController = [thumbImageList objectAtIndex:index];
    [borderImageViewController showBorder];
    preBorderImageView = borderImageViewController;
    [self changeThumbListOffset:index];
}

- (void)changeThumbListOffset:(int)index
{
    float targetYPos = index * (134 + 10) + 10;
    if (targetYPos > thumbImageScrollView.contentSize.height - thumbImageScrollView.frame.size.height) {
        targetYPos = thumbImageScrollView.contentSize.height - thumbImageScrollView.frame.size.height;
    }
    [thumbImageScrollView setContentOffset:CGPointMake(0, targetYPos) animated:YES];
}

- (void)showThumbImageByImageData:(ImageData *)imageData parent:(HLPhotoViewerViewController *)controller
{
    parentController = controller;
    int index = [[parentController imageDataList] indexOfObject:imageData];
    float cellWidth = 184;
    float cellHeight = 134;
    float totalHeight = 0;
    for (ImageData* imgData in [parentController imageDataList]) {
        BorderImageViewController* borderImageViewController = [[BorderImageViewController alloc] init];
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, [thumbImageList count] * (cellHeight + 10) + 10, cellWidth, cellHeight)];
        view.backgroundColor = [UIColor whiteColor];
        [borderImageViewController setView:view];
        [view release];
        [borderImageViewController showImageByImageData:imgData parent:self];
        if (index == [thumbImageList count]) {
            [borderImageViewController showBorder];
            preBorderImageView = borderImageViewController;
        }
        [thumbImageList addObject:borderImageViewController];
        [thumbImageScrollView addSubview:borderImageViewController.view];
        [borderImageViewController release];
    }
    totalHeight = [thumbImageList count] * (cellHeight + 10);
    [thumbImageScrollView setContentSize:CGSizeMake(200, totalHeight)];
    [self changeThumbListOffset:index];
}

- (void)showOriginImageFromBorderImage:(ImageData *)imageData
{
    [self showOriginImageByImageData:imageData parent:parentController];
}

- (void)showOriginImageByImageData:(ImageData *)imageData parent:(HLPhotoViewerViewController *)controller
{
    parentController = controller;
    int index = [[parentController imageDataList] indexOfObject:imageData];
    if (curView != nil) {
        [curView.view removeFromSuperview];
        [curView release];
        curView = nil;
    }
    curView = [[OriginImageViewController alloc] init];
    [curView.view setFrame:CGRectMake(index * FULL_WIDTH, 0, FULL_WIDTH, originImageScrollView.frame.size.height)];
    curView.view.tag = index;
    if (originImageScrollView.frame.size.height == FULL_HEIGHT) {
        [curView loadImageWithImageData:imageData parent:self isFull:YES];
    }else{
        [curView loadImageWithImageData:imageData parent:self isFull:NO];
    }
    [originImageScrollView addSubview:curView.view];
    [originImageScrollView setContentSize:CGSizeMake([[controller imageDataList] count] * FULL_WIDTH, FULL_HEIGHT - 100)];
    [originImageScrollView setContentOffset:CGPointMake(index * FULL_WIDTH, 0) animated:YES];
    [self setNumLabel:index];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
