//
//  PlayerData.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "PlayerData.h"

@implementation PlayerData

@synthesize telephone;
@synthesize allTasks;
@synthesize doneTask;
@synthesize doingTask;
@synthesize bag_num;
@synthesize bid;

- (id)init
{
    if(self = [super init]){
        
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"*************| PlayerData dealloc! |************");
    [telephone release];
    
    [allTasks removeAllObjects];
    [doneTask removeAllObjects];
    [doingTask removeAllObjects];
    [allTasks release];
    [doneTask release];
    [doingTask release];
    
    [super dealloc];
}

@end
