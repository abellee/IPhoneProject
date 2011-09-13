//
//  MapInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "InterfaceDelegate.h"

@interface MapInterface : UIViewController<CLLocationManagerDelegate>{
    id<InterfaceDelegate> delegate;
    
    MKMapView* map;
    CLLocationManager* locationManager;
}

@property (nonatomic, retain) id<InterfaceDelegate> delegate;
@property (nonatomic, retain) MKMapView* map;
@property (nonatomic, retain) CLLocationManager* locationManager;

- (void)initInterface;

@end
