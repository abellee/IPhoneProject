//
//  Location.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-20.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "Location.h"

@implementation Location

@synthesize locationId, locationName;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [locationName release];
    
    [super dealloc];
}

@end
