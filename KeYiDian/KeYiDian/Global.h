//
//  Global.h
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UILoadingView;
@class ASINetworkQueue;
@class KYDUser;
@interface Global : NSObject{
    KYDUser* kydUser;
    int messageNum;
    NSString* currentLocation;
    BOOL isLogin;
}

@property (nonatomic, retain, getter = loadingView, setter = loadingView:) UILoadingView* loadingView;
@property (nonatomic, retain, getter = networkQueue, setter = networkQueue:) ASINetworkQueue* networkQueue;
@property (nonatomic, retain, getter = kydUser, setter = kydUser:) KYDUser* kydUser;
@property (nonatomic, assign, getter = messageNum, setter = messageNum:) int messageNum;
@property (nonatomic, copy, getter = currentLocation, setter = currentLocation:) NSString* currentLocation;

+ (id)sharedInstance;
+ (NSString*)getShopTypeStringWithIntType:(int)type;

@end
