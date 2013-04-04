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
@class Message;
@class ShopInfo;
@class Location;
@interface Global : NSObject{
    KYDUser* kydUser;
    int messageNum;
    NSString* currentLocation;
    BOOL isLogin;
    NSMutableArray* messageList;
    NSMutableArray* shopCollectionList;
    NSMutableArray* foodCollectionList;
    NSMutableArray* historyLocationList;
    BOOL isIPhone5;
}

@property (nonatomic, retain, getter = loadingView, setter = loadingView:) UILoadingView* loadingView;
@property (nonatomic, retain, getter = networkQueue, setter = networkQueue:) ASINetworkQueue* networkQueue;
@property (nonatomic, retain, getter = kydUser, setter = kydUser:) KYDUser* kydUser;
@property (nonatomic, assign, getter = messageNum, setter = messageNum:) int messageNum;
@property (nonatomic, copy, getter = currentLocation, setter = currentLocation:) NSString* currentLocation;
@property (nonatomic, assign, getter = messageList) NSMutableArray* messageList;
@property (nonatomic, assign, getter = shopCollectionList) NSMutableArray* shopCollectionList;
@property (nonatomic, assign, getter = foodCollectionList) NSMutableArray* foodCollectionList;
@property (nonatomic, assign, getter = historyLocationList) NSMutableArray* historyLocationList;
@property (nonatomic, assign, getter = isIPhone5, setter = isIPhone5:) BOOL isIPhone5;

+ (id)sharedInstance;
+ (NSString*)getShopTypeStringWithIntType:(int)type;
+ (UIButton*)getBackwardButton;

- (void)addMessageToList:(Message*)message;
- (void)addShopToCollectionList:(ShopInfo*)shopInfo;
- (void)addFoodToCollectionList:(ShopInfo*)foodInfo;
- (void)addLocationToHistoryList:(Location*)location;

@end
