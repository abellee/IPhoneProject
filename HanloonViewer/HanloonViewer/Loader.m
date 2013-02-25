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

static Loader* instance;

+ (id)sharedLoader{
    if (instance == nil) {
        instance = [[self alloc] init];
    }
    return instance;
}

-(void)startLoad
{
    if(isDownloading){
        return;
    }
    if(conn != nil){
        [conn release];
    }
    [self isDownloading:YES];
    [self performSelectorInBackground:@selector(startLoadImage) withObject:nil];
}

- (void)startLoadImage
{
    ImageDownloadData* imageDownloadData = [imageList objectAtIndex:count];
    NSURL* url = [imageDownloadData url];
    NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn){
        [conn start];
    }
    CFRunLoopRun();
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
    CFRunLoopStop(CFRunLoopGetCurrent());
    ImageDownloadData* imageDownloadData = (ImageDownloadData*)[imageList objectAtIndex:count];
    id<ImageDownloadDelegate> delegate = [imageDownloadData delegate];
    UIImage* img = [UIImage imageWithData:data];
    [imageDownloadData image:img];
    if (delegate && [delegate respondsToSelector:@selector(downloadComplete:)]) {
        [delegate downloadComplete:imageDownloadData];
    }
    if([imageList count] - 1 > count){
        count++;
        [data setLength:0];
        [self isDownloading:NO];
        [self startLoad];
    }else{
        [self reset];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%lld", [response expectedContentLength]);
}

-(void)addImage:(ImageDownloadData *)downloadData
{
    if(imageList == nil){
        imageList = [[NSMutableArray arrayWithCapacity:0] retain];
    }
    [imageList addObject:downloadData];
}

- (void)stopLoad
{
    [conn cancel];
    [self reset];
}

-(void)reset
{
    count = 0;
    [self isDownloading:NO];
    if(imageList != nil)
    {
        [imageList removeAllObjects];
        [imageList release];
    }
    if(data != nil) [data release];
    if(conn != nil) [conn release];
    
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
    if(data != nil) [data release];
    
    [super dealloc];
}

@end
