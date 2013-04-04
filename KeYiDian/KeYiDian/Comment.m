//
//  Comment.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "Comment.h"
#import "KYDUser.h"
#import "ShopInfo.h"
#import "FoodInfo.h"

@implementation Comment

@synthesize kydUser, starNum, commentContent, commentTime, shopInfo, foodInfo;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [kydUser release];
    [commentContent release];
    [shopInfo release];
    [foodInfo release];
    
    [super dealloc];
}

@end
