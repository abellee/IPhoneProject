//
//  Loader.m
//  YiZu
//
//  Created by Lee Abel on 12-10-25.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "Loader.h"
#import "ImageDownloadDelegate.h"
#import "ImageDownloadData.h"

@implementation Loader

@synthesize conn;
@synthesize isDownloading;

-(id)init
{
    if(self = [super init]){
        count = 0;
    }
    return self;
}

-(void)load
{
    if(isDownloading){
        return;
    }
    if(conn != nil){
        [conn release];
    }
    if(data != nil){
        [data release];
        data = nil;
    }
    [self isDownloading:YES];
    ImageDownloadData* imageDownloadData = [imageList objectAtIndex:count];
    NSURL* url = [imageDownloadData url];
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn){
        [conn start];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)rd
{
    NSLog(@"data");
    if(!data){
        data = [[NSMutableData alloc] initWithData:rd];
        return;
    }
    [data appendData:rd];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    ImageDownloadData* imageDownloadData = (ImageDownloadData*)[imageList objectAtIndex:count];
    id<ImageDownloadDelegate> delegate = [imageDownloadData delegate];
    UIImage* img = [UIImage imageWithData:data];
    [delegate downloadComplete:img];
    if([imageList count] - 1 > count){
        count++;
        [self isDownloading:NO];
        [self load];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%lld", [response expectedContentLength]);
}

-(void)addImage:(ImageDownloadData *)downloadData
{
    if(!imageList){
        imageList = [[NSMutableArray arrayWithCapacity:0] retain];
    }
    [imageList addObject:downloadData];
}

-(void)reset
{
    count = 0;
    [self isDownloading:NO];
    [imageList removeAllObjects];
    [data release];
    [conn release];
    
    imageList = nil;
    data = nil;
    conn = nil;
}

-(void)dealloc
{
    NSLog(@"**********| Loader dealloc! |**********");
    [conn cancel];
    [conn release];
    [imageList removeAllObjects];
    [imageList release];
    [data release];
    
    [super dealloc];
}

@end
