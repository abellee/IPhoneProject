//
//  MapInterface.h
//  MovingTribal
//
//  Created by Lee Abel on 9/15/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "InterfaceDelegate.h"

@interface MapInterface : UIViewController<MKMapViewDelegate>{
    id<InterfaceDelegate> delegate;
    
    MKMapView* map;
}

@property (nonatomic, assign) id<InterfaceDelegate> delegate;
@property (nonatomic, retain) MKMapView* map;

- (void)initInterface;

@end
