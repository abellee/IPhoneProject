//
//  OrderInfo.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-3.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShopInfo;
@class Comment;
@interface OrderInfo : NSObject

@property (nonatomic, retain, getter = shopInfo, setter = shopInfo:) ShopInfo* shopInfo;
@property (nonatomic, copy, getter = orderNum, setter = orderNum:) NSString* orderNum;
@property (nonatomic, assign, getter = orderTime, setter = orderTime:) int orderTime;
@property (nonatomic, assign, getter = telephone, setter = telephone:) int telephone;
@property (nonatomic, retain, getter = foodList, setter = foodList:) NSMutableArray* foodList;
@property (nonatomic, assign, getter = deliveryCost, setter = deliveryCost:) int deliveryCost;
@property (nonatomic, assign, getter = saveMoney, setter = saveMoney:) int saveMoney;
@property (nonatomic, assign, getter = totalNum, setter = totalNum:) int totalNum;
@property (nonatomic, assign, getter = totalMoney, setter = totalMoney:) int totalMoney;
@property (nonatomic, assign, getter = orderStatus, setter = orderStatus:) int orderStatus;
@property (nonatomic, assign, getter = isComment, setter = isComment:) BOOL isComment;
@property (nonatomic, retain, getter = comment, setter = comment:) Comment* comment;

@end
