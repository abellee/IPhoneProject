//
//  CateData.m
//  HanloonViewer
//
//  Created by Lee Abel on 13-2-17.
//  Copyright (c) 2013年 Abel Lee. All rights reserved.
//

#import "CateData.h"

@implementation CateData

@synthesize cateId;
@synthesize cateName;

- (void)dealloc
{
    NSLog(@"Cate Data Dealloc!");
    if (cateName != nil) {
        [cateName release];
    }
    [super dealloc];
}

@end
