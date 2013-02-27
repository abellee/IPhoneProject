//
//  AVCaptureCameraViewController.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-26.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import "AVCaptureDelegate.h"
#import "CameraOverlayDelegate.h"

@class CameraOverlayViewController;
@interface AVCaptureCameraViewController : UIViewController<CameraOverlayDelegate, UIAccelerometerDelegate>{
    AVCaptureDeviceInput* deviceInput;
    AVCaptureStillImageOutput* output;
    AVCaptureSession* cameraSession;
    
    UIView* effectView;
    
    id<AVCaptureDelegate> delegate;
    
    CameraOverlayViewController* cameraOverlay;
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id<AVCaptureDelegate> delegate;

- (void)startRunning;
- (void)takePhoto;

@end
