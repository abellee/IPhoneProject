//
//  ImageDownloadData.m
//  YiZu
//
//  Created by Lee Abel on 12-10-26.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "ImageDownloadData.h"

@implementation ImageDownloadData

@synthesize url;
@synthesize delegate;

-(void)dealloc
{
    NSLog(@"**********| ImageDownloadData dealloc! |*********");
    [url release];
    [delegate release];
    
    [super dealloc];
}

@end
