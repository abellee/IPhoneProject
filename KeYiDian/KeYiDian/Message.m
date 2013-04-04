//
//  Message.m
//  KeYiDian
//
//  Created by Lee Abel on 13-3-19.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "Message.h"

@implementation Message

@synthesize messageId, status, content, title;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [content release];
    [title release];
    
    [super dealloc];
}

@end
