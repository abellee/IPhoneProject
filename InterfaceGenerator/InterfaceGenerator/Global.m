//
//  Global.m
//  InterfaceGenerator
//
//  Created by Lee Abel on 13-4-28.
//  Copyright (c) 2013年 YiZu. All rights reserved.
//

#import "Global.h"

@implementation Global

@synthesize publicResource, publicResPath, canvasWidth, canvasHeight, curResource, app;

static Global* instance;

+ (id)sharedGlobal
{
    if (instance == nil) {
        instance = [[self alloc] init];
    }
    return instance;
}

@end
