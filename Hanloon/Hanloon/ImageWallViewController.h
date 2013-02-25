//
//  ImageWallViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-24.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class HLPhotoViewerViewController;
@interface ImageWallViewController : UIViewController<UIScrollViewDelegate>{
    UIImageView* background;
    UIImageView* hanloonLogo;
    
    float preDis;
    
    NSMutableArray* shadowImageList;
    UIScrollView* scrollView;
    
    UILabel* totalNumLabel;
    
    HLPhotoViewerViewController* parentController;
}

- (void)showImages:(NSMutableArray*)array num:(int)totalNum parent:(HLPhotoViewerViewController*)controller;
- (void)addImage:(int)addedNum;

@end
