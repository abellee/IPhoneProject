//
//  NSString+Extensions.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "NSString+Extensions.h"
#import "Definitions.h"

@implementation NSString (Extensions)

+ (NSString*)getShopTypeStringWithIntType:(int)type
{
    switch (type) {
        case CHINESE:
            return @"中式";
            break;
        case COOK:
            return @"烧烤";
        case WEST:
            return @"西式";
        case XIAOCHI:
            return @"小吃";
        case JAPAN:
            return @"日式";
        case CAKE:
            return @"蛋糕甜点";
        case KOREA:
            return @"韩式";
        case MILK:
            return @"奶茶";
            
        default:
            break;
    }
    return @"中式";
}

@end
