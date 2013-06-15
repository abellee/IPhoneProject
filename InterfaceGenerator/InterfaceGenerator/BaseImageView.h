//
//  BaseImageView.h
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-4-28.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ImageInfo;
@interface BaseImageView : NSImageView
{
    NSTextField* publicLabel;
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id delegate;
@property (nonatomic, retain, getter = imageInfo, setter = imageInfo:) ImageInfo* imageInfo;

- (void)showPublicLabel;

@end
