//
//  MainLayerViewController.h
//  YiZu
//
//  Created by Lee Abel on 12-10-27.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewDelegate.h"

@class WorldMapLayer;
@class ProfileLayer;
@class SystemSettingLayer;
@class ResourceViewController;
@class ShopViewController;
@class StoreHouseViewController;

@interface MainLayerViewController : UIViewController<MainViewDelegate>{
    UINavigationController* navigationController;
    
    WorldMapLayer* worldMap;
    ShopViewController* shop;
    StoreHouseViewController* storehouse;
    ResourceViewController* resource;
    SystemSettingLayer* systemSetting;
    ProfileLayer* profile;
}

@end
