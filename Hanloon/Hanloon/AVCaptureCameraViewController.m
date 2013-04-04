//
//  AVCaptureCameraViewController.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-26.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "AVCaptureCameraViewController.h"
#import "Definitions.h"
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>
#import <ImageIO/ImageIO.h>
#import "CameraOverlayViewController.h"
#import "PickrImage.h"
#import <Accelerate/Accelerate.h>

@interface AVCaptureCameraViewController ()

@end

@implementation AVCaptureCameraViewController

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"************************ AVCaptureCameraViewController dealloc ********************************");
    
    [cameraSession release];
    [deviceInput release];
    [output release];
    [effectView release];
    [cameraOverlay release];
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    cameraSession = [[AVCaptureSession alloc] init];
    cameraSession.sessionPreset = AVCaptureSessionPresetPhoto;
    
    AVCaptureDevice* camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    deviceInput = [[AVCaptureDeviceInput deviceInputWithDevice:camera error:nil] retain];
    
    if (!deviceInput) {
        
        return;
    }
    
    if ([cameraSession canAddInput:deviceInput]) {
        [cameraSession addInput:deviceInput];
        
        output = [[AVCaptureStillImageOutput alloc] init];
        NSDictionary* outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
        [output setOutputSettings:outputSettings];
        [outputSettings release];
        [cameraSession addOutput:output];
        
        CALayer* layer = self.view.layer;
        AVCaptureVideoPreviewLayer* captureVideoLayer = [AVCaptureVideoPreviewLayer layerWithSession:cameraSession];
        [captureVideoLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
        [captureVideoLayer setFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
        captureVideoLayer.orientation = AVCaptureVideoOrientationLandscapeRight;
        [layer addSublayer:captureVideoLayer];
        [cameraSession commitConfiguration];
    }else{
        
        return;
    }
    
    effectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
    effectView.backgroundColor = [UIColor whiteColor];
    effectView.alpha = 0.7;
    
    cameraOverlay = [[CameraOverlayViewController alloc] init];
    cameraOverlay.delegate = self;
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FULL_WIDTH, FULL_HEIGHT)];
    [cameraOverlay setView:view];
    [view release];
    [self.view addSubview:cameraOverlay.view];
}

- (void)closeButtonPressed
{
    if (delegate && [delegate respondsToSelector:@selector(cancelCapture)]) {
        [cameraSession stopRunning];
        [delegate cancelCapture];
    }
}

- (void)doneButtonPressed
{
    if (delegate && [delegate respondsToSelector:@selector(doneCapture)]) {
        [cameraSession stopRunning];
        [delegate doneCapture];
    }
}

- (void)takePhotoPressed
{
    [self takePhoto];
}

- (void)startRunning
{
    if (cameraSession == nil) {
        return;
    }
    
    [cameraSession startRunning];
}

- (void)animationStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    [effectView removeFromSuperview];
    effectView.alpha = 0.7;
}

- (void)takePhoto
{
    [self.view addSubview:effectView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationStop:finished:context:)];
    effectView.alpha = 0;
    [UIView commitAnimations];
    
    AVCaptureConnection* captureConn = nil;
    for (AVCaptureConnection* conn in output.connections) {
        for (AVCaptureInputPort* inputPort in conn.inputPorts) {
            if ([[inputPort mediaType] isEqual:AVMediaTypeVideo]) {
                captureConn = conn;
                break;
            }
        }
        if (captureConn) {
            break;
        }
    }
    
    [output captureStillImageAsynchronouslyFromConnection:captureConn completionHandler:^(CMSampleBufferRef imageSampleBuffer, NSError* error){
        CFDictionaryRef exifAttachments = CMGetAttachment(imageSampleBuffer, kCGImagePropertyExifDictionary, NULL);
        if (exifAttachments) {
            
        }

        NSData* imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
        UIImage* image = [[UIImage alloc] initWithData:imageData];
        
        UIImage* finalImage = [[UIImage alloc] initWithCGImage:image.CGImage scale:1.0 orientation:AVCaptureVideoOrientationLandscapeRight];
        if (delegate && [delegate respondsToSelector:@selector(finishTakePicture:)]) {
            PickrImage* pickrImage = [[[PickrImage alloc] init] autorelease];
            [pickrImage image: finalImage];
            [pickrImage isAlbum: NO];
            [delegate finishTakePicture: pickrImage];
        }
        [image release];
        [finalImage release];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
