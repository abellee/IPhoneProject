//
//  TestingAnnotation.h
//  MovingTribal
//
//  Created by Lee Abel on 9/14/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface TestingAnnotation : NSObject<MKAnnotation>{
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

- (id)initWidthCoordinate:(CLLocationCoordinate2D)coor;

@end
