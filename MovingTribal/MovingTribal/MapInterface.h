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
    
    MKMapView* map;
    CLLocationManager* locationManager;
    BOOL found;
    TestingAnnotation* anno;
}

@property (nonatomic, assign) id<MainContainerDelegate> delegate;
@property (nonatomic, retain) MKMapView* map;
@property (nonatomic, assign) CLLocationManager* locationManager;
@property (nonatomic, assign) BOOL found;
@property (nonatomic, assign) TestingAnnotation* anno;

- (void)initInterface;

@end
