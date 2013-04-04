//
//  FoodInfo.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "FoodInfo.h"

@implementation FoodInfo

@synthesize foodImage, starNum, isZhao, commentNum, soldNum, isCollected, foodDescription, commentList, foodName, foodNum;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [foodImage release];
    [foodDescription release];
    [commentList removeAllObjects];
    [commentList release];
    [foodName release];
    
    [super dealloc];
}

@end
