//
//  ImageDownloadDelegagte.h
//  YiZu
//
//  Created by Lee Abel on 12-10-26.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImageDownloadData;

@protocol ImageDownloadDelegate <NSObject>

@required
-(void)downloadComplete:(ImageDownloadData*)data;

@optional
-(void)downloading:(long long)bytesLoaded totalBytes:(long long)totalBytes;

@end
