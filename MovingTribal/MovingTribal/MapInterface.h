//
//  MapInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/15/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MainContainerDelegate.h"
#import "TestingAnnotation.h"

@interface MapInterface : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>{
    id<MainContainerDelegate> delegate;
    TestingAnnotation* anno;
    
    MKMapView* map;
    CLLocationManager* locationManager;
    UIAlertView* alertView;
    BOOL found;
    BOOL isService;
}

@property (nonatomic, assign) id<MainContainerDelegate> delegate;
@property (nonatomic, assign) TestingAnnotation* anno;
@property (nonatomic, retain) MKMapView* map;
@property (nonatomic, assign) CLLocationManager* locationManager;
@property (nonatomic, assign) UIAlertView* alertView;
@property (nonatomic, assign) BOOL found;
@property (nonatomic, assign) BOOL isService;

- (void)initInterface;

@end
