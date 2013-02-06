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
    id<ImageDownloadDelegate> delegate;
}

@property (nonatomic, retain, getter = url, setter = url:) NSURL* url;
@property (nonatomic, retain, getter = delegate, setter = delegate:) id<ImageDownloadDelegate> delegate;

@end
