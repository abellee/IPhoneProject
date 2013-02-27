//
//  CameraOverlayViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-26.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraOverlayDelegate.h"

@interface CameraOverlayViewController : UIViewController{
    UIButton* takePhotoButton;
    UIButton* closeButton;
    UIButton* doneButton;
    UIScrollView* previewScrollView;
    
    UIImageView* background;
    UIView* dock;
    
    id<CameraOverlayDelegate> delegate;
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id<CameraOverlayDelegate> delegate;

@end
