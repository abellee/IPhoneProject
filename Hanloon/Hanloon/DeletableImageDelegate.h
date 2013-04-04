//
//  DeletableImageDelegate.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-27.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DeletableImageViewController;
@class PickrImage;
@protocol DeletableImageDelegate <NSObject>

@required
- (void)deleteImage:(PickrImage*)image controller:(DeletableImageViewController*)imageViewController;

@end
