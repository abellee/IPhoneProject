//
//  ImageGroupViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-25.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageData;
@class HLPhotoViewerViewController;
@class BorderImageViewController;
@class OriginImageViewController;
@interface ImageGroupViewController : UIViewController<UIScrollViewDelegate>{
    UIButton* closeButton;
    UIButton* upButton;
    UIButton* downButton;
    
    UIView* leftDock;
    UIView* rightDock;
    
    UIScrollView* originImageScrollView;
    UIScrollView* thumbImageScrollView;
    
    NSMutableArray* thumbImageList;
    
    UILabel* numLabel;
    UILabel* nameLabel;
    
    HLPhotoViewerViewController* parentController;
    BorderImageViewController* preBorderImageView;
    
    OriginImageViewController* curView;
}

- (void)showOriginImageByImageData:(ImageData*)imageData parent:(HLPhotoViewerViewController*)controller;
- (void)showThumbImageByImageData:(ImageData*)imageData parent:(HLPhotoViewerViewController*)controller;
- (void)showOriginImageFromBorderImage:(ImageData*)imageData;
- (void)fullGroupView;
- (void)exitGroupView;
- (void)nextPageLoaded:(int)num;

@end
