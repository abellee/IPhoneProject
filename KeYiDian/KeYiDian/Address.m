//
//  Address.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "Address.h"

@implementation Address

@synthesize address, telephone, shortNum, secondTel, isDefault;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [address release];
    [telephone release];
    [secondTel release];
    
    [super dealloc];
}

@end
