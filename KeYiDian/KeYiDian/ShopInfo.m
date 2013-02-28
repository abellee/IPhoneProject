//
//  ShopInfo.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "ShopInfo.h"
#import "ImageURL.h"

@implementation ShopInfo

@synthesize logo, shopName, shopType, starNum, commentNum, distance, isZhao, isXin, isTe, isDuo, imageURL, shopId;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [logo release];
    [shopName release];
    [imageURL release];
    
    logo = nil;
    shopName = nil;
    imageURL = nil;
    
    [super dealloc];
}

@end
