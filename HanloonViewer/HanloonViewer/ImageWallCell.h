//
//  ImageWallCell.h
//  HanloonViewer
//
//  Created by Lee Abel on 13-2-16.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ImageDownloadDelegate.h"

@interface ImageWallCell : UITableViewCell<ImageDownloadDelegate>{
    int imageNum;
    int maxImageNum;
    NSIndexPath* curIndexPath;
    
    NSMutableArray* imageList;
}

- (BOOL)canAddImage;
- (void)initImageWithImageDownloadData:(NSArray*)downloadData maxNum:(int)maxNum indexPath:(NSIndexPath*)indexPath;

@end
