//
//  AVCaptureDelegate.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-27.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PickrImage;
@protocol AVCaptureDelegate <NSObject>

@optional
- (void)finishTakePicture:(PickrImage*)image;
- (void)cancelCapture;
- (void)doneCapture;

@end
