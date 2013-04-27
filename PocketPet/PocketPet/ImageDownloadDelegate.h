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

@optional
-(void)downloadComplete:(ImageDownloadData*)data image:(UIImage*)img;
-(void)downloading:(long long)bytesLoaded totalBytes:(long long)totalBytes;

@end
