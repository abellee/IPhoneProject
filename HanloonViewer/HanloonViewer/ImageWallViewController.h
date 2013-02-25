//
//  ImageWallViewController.h
//  HanloonViewer
//
//  Created by Abel Lee on 13-2-13.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDownloadDelegate.h"

@interface ImageWallViewController : UIViewController<UIScrollViewDelegate, ImageDownloadDelegate>{
    UIScrollView* scrollView;
    NSMutableArray* imageList;
    UILabel* footLabel;
    
    float preDis;
}

- (void)showImages;
- (void)addImages:(int)num;
- (void)showImagesUnadded:(ImageDownloadData*)data;

@end
