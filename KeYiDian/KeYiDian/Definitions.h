//
//  Definitions.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#ifndef KeYiDian_Definitions_h
#define KeYiDian_Definitions_h

#define FULL_WIDTH [UIScreen mainScreen].bounds.size.width
#define FULL_HEIGHT [UIScreen mainScreen].bounds.size.height

#define BASE_URL @"http://localhost"

typedef enum Tastes{
    CHINESE,
    COOK,
    WEST,
    XIAOCHI,
    JAPAN,
    CAKE,
    KOREA,
    ALL,
    MILK
}Tastes;

typedef enum CollectionType{
    SHOP,
    FOOD
}CollectionType;

typedef enum MessageStatus{
    SUCCESS,
    FAILED
}MessageStatus;

#endif
