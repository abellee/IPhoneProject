//
//  NSImage+Extensions.m
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-5-15.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import "NSImage+Extensions.h"

@implementation NSImage (Extensions)

- (NSImage*)imageRotatedByDegrees:(CGFloat)degrees {
    
	NSImage *image = self;
    
    if (degrees == 0) {
        return image;
    } else {
        NSSize beforeSize = [image size];
        NSSize afterSize = degrees == 90 || degrees == -90 ? NSMakeSize(beforeSize.height, beforeSize.width) : beforeSize;
        NSImage* newImage = [[NSImage alloc] initWithSize:afterSize];
        NSAffineTransform* trans = [NSAffineTransform transform];
        
        [newImage lockFocus];
        [trans translateXBy:afterSize.width * 0.5 yBy:afterSize.height * 0.5];
        [trans rotateByDegrees:degrees];
        [trans translateXBy:-beforeSize.width * 0.5 yBy:-beforeSize.height * 0.5];
        [trans set];
        [image drawAtPoint:NSZeroPoint
                  fromRect:NSMakeRect(0, 0, beforeSize.width, beforeSize.height)
                 operation:NSCompositeCopy
                  fraction:1.0];
        [newImage unlockFocus];
        return newImage;
    }
    
}

@end
