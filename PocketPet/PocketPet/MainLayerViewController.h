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
@class MapViewController;
@class ProfileLayer;
@class PetHouseViewController;
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
    PetHouseViewController* pethouse;
    SystemSettingLayer* systemSetting;
    ProfileLayer* profile;
    MapViewController* map;
}

@end
