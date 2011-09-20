//
//  DataGetter.m
//  MovingTribal
//
//  Created by Lee Abel on 9/19/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "DataGetter.h"

@implementation DataGetter

@synthesize timer;
@synthesize currentTimes;

- (id)init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"******| DataGetter |****** receive dealloc message!");
    [timer invalidate];
    [timer release];
    [super dealloc];
}

- (void)initTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(timerHandler:) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)startFetchData:(NSString *)url
{
    
}

- (void)timerHandler:(NSTimer *)t
{
    currentTimes++;
    if([[UIApplication sharedApplication] applicationState] == UIApplicationStateBackground && (currentTimes % 2 == 0)){
        // run in background
        NSLog(@"run in baackground!");
        return;
    }
    NSLog(@"run in foreground!");
}

@end
