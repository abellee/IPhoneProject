//
//  ImageDownloadData.h
//  YiZu
//
//  Created by Lee Abel on 12-10-26.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageDownloadDelegate.h"
@interface ImageDownloadData : NSObject{
    NSURL* url;
    NSURL* origin;
    NSString* title;
    id<ImageDownloadDelegate> delegate;
    int tag;
    UIImage* image;
    UIImage* originImage;
}

@property (nonatomic, retain, getter = url, setter = url:) NSURL* url;
@property (nonatomic, retain, getter = delegate, setter = delegate:) id<ImageDownloadDelegate> delegate;
@property (nonatomic, assign, getter = tag, setter = tag:) int tag;

@property (nonatomic, retain, getter = origin, setter = origin:) NSURL* origin;
@property (nonatomic, retain, getter = title, setter = title:) NSString* title;

@property (nonatomic, retain, getter = image, setter = image:) UIImage* image;
@property (nonatomic, retain, getter = originImage, setter = originImage:) UIImage* originImage;

@end
