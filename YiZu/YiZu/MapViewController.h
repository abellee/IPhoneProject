//
//  MapViewController.h
//  YiZu
//
//  Created by Lee Abel on 12-10-27.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>{
    CLLocationManager* localManager;
    MKMapView* map;
}

@property (nonatomic, retain) CLLocationManager* localManager;
@property (nonatomic, retain) MKMapView* map;

@end
