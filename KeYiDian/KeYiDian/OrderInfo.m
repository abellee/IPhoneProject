//
//  OrderInfo.m
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "OrderInfo.h"
#import "ShopInfo.h"

@implementation OrderInfo

@synthesize shopInfo, orderNum, orderTime, telephone, deliveryCost, saveMoney, foodList, totalMoney, orderStatus, isComment;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [shopInfo release];
    [orderNum release];
    [foodList removeAllObjects];
    [foodList release];
    
    [super dealloc];
}

@end
