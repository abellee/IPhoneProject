//
//  Global.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "Global.h"

@implementation Global

@synthesize loadingView, networkQueue;

static Global* instance;

+ (id)sharedInstance
{
    if (instance == nil) {
        instance = [[self alloc] init];
    }
    return instance;
}

@end
