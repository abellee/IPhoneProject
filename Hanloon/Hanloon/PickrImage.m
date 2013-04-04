//
//  PickrImage.m
//  Hanloon
//
//  Created by Lee Abel on 13-3-18.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import "PickrImage.h"

@implementation PickrImage

@synthesize image, isAlbum;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [image release];
    
    [super dealloc];
}

@end
