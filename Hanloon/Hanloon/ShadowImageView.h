//
//  ShadowImageView.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-25.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageData;
@class HLPhotoViewerViewController;
@interface ShadowImageView : UIView<NSURLConnectionDelegate>{
    UIImageView* background;
    NSURLConnection* conn;
    UIActivityIndicatorView* activityIndicator;
    NSMutableData* imgData;
    
    ImageData* imageData;
    
    HLPhotoViewerViewController* parentController;
    
    BOOL isLoading;
}

@property (nonatomic, retain, getter = imageData, setter = imageData:) ImageData* imageData;
@property (nonatomic, assign, getter = parentController, setter = parentController:) HLPhotoViewerViewController* parentController;

@end
