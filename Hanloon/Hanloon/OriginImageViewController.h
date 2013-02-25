//
//  OriginImageViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-25.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageData;
@class ImageGroupViewController;
@interface OriginImageViewController : UIViewController<NSURLConnectionDelegate, UIScrollViewDelegate>{
    UIScrollView* imageScrollView;
    UIActivityIndicatorView* indicatorView;
    NSURLConnection* conn;
    
    ImageData* data;
    NSMutableData* originImageData;
    UIImageView* imageView;
    
    BOOL isLoading;
    
    ImageGroupViewController* parentController;
    
    BOOL isFull;
}

- (void)loadImageWithImageData:(ImageData*)imageData parent:(ImageGroupViewController*)controller isFull:(BOOL)full;

@end
