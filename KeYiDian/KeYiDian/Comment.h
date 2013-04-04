//
//  Comment.h
//  KeYiDian
//
//  Created by Lee Abel on 13-4-2.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum kCommentType{
    USER_COMMENT,
    MERCHANT_COMMENT
}kCommentType;

@class KYDUser;
@class ShopInfo;
@class FoodInfo;
@interface Comment : NSObject

@property (nonatomic, retain, getter = kydUser, setter = kydUser:) KYDUser* kydUser;
@property (nonatomic, assign, getter = starNum, setter = starNum:) int starNum;
@property (nonatomic, copy, getter = commentContent, setter = commentContent:) NSString* commentContent;
@property (nonatomic, assign, getter = commentTime, setter = commentTime:) int commentTime;
@property (nonatomic, retain, getter = shopInfo, setter = shopInfo:) ShopInfo* shopInfo;
@property (nonatomic, retain, getter = foodInfo, setter = foodInfo:) FoodInfo* foodInfo;
@property (nonatomic, assign, getter = commentType, setter = commentType:) kCommentType commentType;

@end
