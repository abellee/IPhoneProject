//
//  DeletableImageDelegate.h
//  Hanloon
//
//  Created by Lee Abel on 13-2-27.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DeletableImageViewController;
@protocol DeletableImageDelegate <NSObject>

@required
- (void)deleteImage:(UIImage*)image controller:(DeletableImageViewController*)imageViewController;

@end
