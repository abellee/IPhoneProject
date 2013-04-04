//
//  ShopInfo.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-28.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImageURL;
@interface ShopInfo : NSObject{
    UIImage* logo;
    NSString* shopName;
    
    int shopType;
    int starNum;
    int commentNum;
    int distance;
    int shopId;
    int deliveryCost;
    
    BOOL isZhao;
    BOOL isXin;
    BOOL isTe;
    BOOL isDuo;
    BOOL isCollected;
    
    ImageURL* imageURL;
}

@property (nonatomic, retain, getter = logo, setter = logo:) UIImage* logo;
@property (nonatomic, copy, getter = shopName, setter = shopName:) NSString* shopName;

@property (nonatomic, assign, getter = shopType, setter = shopType:) int shopType;
@property (nonatomic, assign, getter = starNum, setter = starNum:) int starNum;
@property (nonatomic, assign, getter = commentNum, setter = commentNum:) int commentNum;
@property (nonatomic, assign, getter = distance, setter = distance:) int distance;
@property (nonatomic, assign, getter = shopId, setter = shopId:) int shopId;
@property (nonatomic, assign, getter = deliveryCost, setter = deliveryCost:) int deliveryCost;

@property (nonatomic, assign, getter = isZhao, setter = isZhao:) BOOL isZhao;
@property (nonatomic, assign, getter = isXin, setter = isXin:) BOOL isXin;
@property (nonatomic, assign, getter = isTe, setter = isTe:) BOOL isTe;
@property (nonatomic, assign, getter = isDuo, setter = isDuo:) BOOL isDuo;
@property (nonatomic, assign, getter = isCollected, setter = isCollected:) BOOL isCollected;

@property (nonatomic, retain, getter = imageURL, setter = imageURL:) ImageURL* imageURL;

@end
