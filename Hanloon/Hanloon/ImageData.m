//
//  ImageData.m
//  Hanloon
//
//  Created by Lee Abel on 13-2-25.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "ImageData.h"

@implementation ImageData

@synthesize originImage;
@synthesize thumbImage;
@synthesize name;
@synthesize originImageData;
@synthesize thumbImageData;

- (void)dealloc
{
    NSLog(@"********************* ImageData dealloc ****************************");
    
    [originImage release];
    [thumbImage release];
    [name release];
    [originImageData release];
    [thumbImageData release];
    
    [super dealloc];
}

@end
