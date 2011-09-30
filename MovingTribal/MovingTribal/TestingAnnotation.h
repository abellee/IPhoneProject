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
	
	NSString* anoTitle;
	NSString* anoSubtitle;
	
	int uid;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign, getter = title, setter = title:) NSString* anoTitle;
@property (nonatomic, assign, getter = subtitle, setter = subtitle:) NSString* anoSubtitle;
@property (nonatomic, assign, getter = uid, setter = uid:) int uid;

- (id)initWidthCoordinate:(CLLocationCoordinate2D)coor;

@end
