//
//  WorldMapLayer.h
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WorldMapLayer : UIViewController{
    CLLocationManager* localManager;
    MKMapView* map;
}

@property (nonatomic, retain) CLLocationManager* localManager;
@property (nonatomic, retain) MKMapView* map;

@end
