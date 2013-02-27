//
//  CameraOverlayDelegate.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-27.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CameraOverlayDelegate <NSObject>

@optional
- (void)closeButtonPressed;
- (void)doneButtonPressed;
- (void)takePhotoPressed;

@end
