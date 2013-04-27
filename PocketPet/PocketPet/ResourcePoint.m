//
//  ResourcePoint.m
//  YiZu
//
//  Created by Lee Abel on 12-10-27.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "ResourcePoint.h"

@implementation ResourcePoint

@synthesize type, subtype, level;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

@end
