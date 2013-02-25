//
//  Loader.h
//  YiZu
//
//  Created by Lee Abel on 12-10-25.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImageDownloadData;

@interface Loader : NSObject<NSURLConnectionDelegate>{
    NSURLConnection* conn;
    NSMutableData* data;
    NSMutableArray* imageList;
    int count;
    BOOL isDownloading;
}

@property (nonatomic, retain) NSURLConnection* conn;
@property (nonatomic, assign, getter = isDownloading, setter = isDownloading:) BOOL isDownloading;

+ (id)sharedLoader;
-(void)startLoad;
-(void)addImage:(ImageDownloadData*)downloadData;
-(void)reset;
-(void)stopLoad;

@end
