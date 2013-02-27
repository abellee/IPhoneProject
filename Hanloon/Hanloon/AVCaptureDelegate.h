//
//  AVCaptureDelegate.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-27.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AVCaptureDelegate <NSObject>

@optional
- (void)finishTakePicture:(UIImage*)image;
- (void)cancelCapture;
- (void)doneCapture;

@end
