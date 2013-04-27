//
//  Global.m
//  KeYiDian
//
//  Created by Lee Abel on 13-2-21.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import "Global.h"
#import "Definitions.h"
#import "UIImage+Extensions.h"

@implementation Global

@synthesize loadingView, networkQueue, kydUser, messageNum, currentLocation, messageList, shopCollectionList, foodCollectionList, historyLocationList, isIPhone5, curApp, isLogin;

static Global* instance;

+ (id)sharedInstance
{
    if (instance == nil) {
        instance = [[self alloc] init];
    }
    return instance;
}

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

+ (UIButton*)getBackwardButton
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* normalSkin = [UIImage getImageWithFileName:@"fanhui0"];
    UIImage* highlightedSkin = [UIImage getImageWithFileName:@"fanhui1"];
    [btn setImage:normalSkin forState:UIControlStateNormal];
    [btn setImage:highlightedSkin forState:UIControlStateHighlighted];
    [btn setFrame:CGRectMake(0, 0, normalSkin.size.width, normalSkin.size.height)];
    return btn;
}

- (void)addMessageToList:(Message *)message
{
    if (messageList == nil) {
        messageList = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [messageList addObject:message];
}

- (void)addShopToCollectionList:(ShopInfo *)shopInfo
{
    if (shopCollectionList == nil) {
        shopCollectionList = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [shopCollectionList addObject: shopInfo];
}

- (void)addFoodToCollectionList:(ShopInfo *)foodInfo
{
    if (foodCollectionList == nil) {
        foodCollectionList = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [foodCollectionList addObject:foodInfo];
}

- (void)addLocationToHistoryList:(Location *)location
{
    if (historyLocationList == nil) {
        historyLocationList = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [historyLocationList addObject:location];
}

@end
