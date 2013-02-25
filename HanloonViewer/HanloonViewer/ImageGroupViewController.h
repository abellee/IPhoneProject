//
//  ImageGroupViewController.h
//  HanloonViewer
//
//  Created by Lee Abel on 13-2-16.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDownloadDelegate.h"

@class ImageDownloadData;
@class ShadowViewController;
@class LoadingView;
@interface ImageGroupViewController : UIViewController<NSURLConnectionDelegate, UIScrollViewDelegate, ImageDownloadDelegate>{
    UIScrollView* horizontalView;
    UIScrollView* verticalView;
    UIScrollView* scaleView;
    
    UIButton* closeButton;
//    UIButton* saveButton;
    
    UILabel* titleLabel;
    UILabel* countLabel;
    
    UIButton* upButton;
    UIButton* downButton;
    
    UIView* leftBack;
    UIView* rightBack;
    
    ImageDownloadData* curData;
    
    UIActivityIndicatorView* loadingView;
    
    NSURLConnection* conn;
    NSMutableData* imageData;
    
    NSMutableArray* addImageData;
    NSMutableArray* thumbImageList;
    
    ShadowViewController* lastShadowView;
    
    UIScrollView* curView;
    
    UIImageView* scaleImage;
    
    LoadingView* loadingViewBack;
}

- (void)showImageWithDownloadData:(ImageDownloadData*)data;
- (void)addAditionalImage:(int)num;

@end
