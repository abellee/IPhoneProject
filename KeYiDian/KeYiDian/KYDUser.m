//
//  KYDUser.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-8.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "KYDUser.h"

@implementation KYDUser

@synthesize username;
@synthesize password;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [username release];
    [password release];
    
    [super dealloc];
}

@end
