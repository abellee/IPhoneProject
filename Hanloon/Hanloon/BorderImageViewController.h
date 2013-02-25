//
//  BorderImageViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-25.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ImageData;
@class ImageGroupViewController;
@interface BorderImageViewController : UIViewController<NSURLConnectionDelegate>{
    ImageData* imageData;
    UIActivityIndicatorView* indicatorView;
    NSURLConnection* conn;
    
    NSMutableData* mutableData;
    
    BOOL isLoading;
    
    ImageGroupViewController* parentController;
}


- (void)showImageByImageData:(ImageData*)data parent:(ImageGroupViewController*)controller;
- (void)showBorder;
- (void)hideBorder;

@end
