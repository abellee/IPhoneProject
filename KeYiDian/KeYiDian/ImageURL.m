//
//  ImageURL.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ImageURL.h"

@implementation ImageURL

@synthesize thumbImage;
@synthesize middleImage;
@synthesize originImage;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [thumbImage release];
    [middleImage release];
    [originImage release];
    
    thumbImage = nil;
    middleImage = nil;
    originImage = nil;
    
    [super dealloc];
}

@end
