//
//  CameraOverlayViewController.h
//  Photygraphy
//
//  Created by Lee Abel on 12-12-26.
//  Copyright (c) 2012年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraOverlayViewController : UIViewController{
    UIToolbar* toolbar;
    NSMutableArray* imageList;
}

- (void)setViewFrame:(CGRect)rect;

@end
