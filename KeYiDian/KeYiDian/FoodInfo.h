//
//  FoodInfo.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodInfo : NSObject

@property (nonatomic, copy, getter = foodImage, setter = foodImage:) NSString* foodImage;
@property (nonatomic, assign, getter = starNum, setter = starNum:) int starNum;
@property (nonatomic, assign, getter = isZhao, setter = isZhao:) BOOL isZhao;
@property (nonatomic, assign, getter = commentNum, setter = commentNum:) int commentNum;
@property (nonatomic, assign, getter = soldNum, setter = soldNum:) int soldNum;
@property (nonatomic, assign, getter = price, setter = price:) float price;
@property (nonatomic, assign, getter = isCollected, setter = isCollected:) BOOL isCollected;
@property (nonatomic, copy, getter = foodDescription, setter = foodDescription:) NSString* foodDescription;
@property (nonatomic, retain, getter = commentList, setter = commentList:) NSMutableArray* commentList;
@property (nonatomic, copy, getter = foodName, setter = foodName:) NSString* foodName;
@property (nonatomic, assign, getter = foodNum, setter = foodNum:) int foodNum;

@end
