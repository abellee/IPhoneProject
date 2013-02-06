//
//  DBPP_Maps.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBPP_Maps : NSManagedObject

@property (nonatomic, retain) NSString * map_name;
@property (nonatomic, retain) NSNumber * map_id;
@property (nonatomic, retain) NSNumber * map_nation_id;
@property (nonatomic, retain) NSNumber * map_real_id;
@property (nonatomic, retain) NSNumber * lt_longtide;
@property (nonatomic, retain) NSNumber * lt_latitude;
@property (nonatomic, retain) NSNumber * rb_longitude;
@property (nonatomic, retain) NSNumber * rb_latitude;

@end
