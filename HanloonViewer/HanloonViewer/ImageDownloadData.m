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
@synthesize tag;
@synthesize image;
@synthesize origin;
@synthesize title;
@synthesize originImage;

-(void)dealloc
{
    NSLog(@"**********| ImageDownloadData dealloc! |*********");
    [url release];
    if(delegate != nil) [delegate release];
    [image release];
    [origin release];
    [title release];
    [originImage release];
    
    [super dealloc];
}

@end
