//
//  DBPP_ResPoint_Template.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBPP_ResPoint_Template : NSManagedObject

@property (nonatomic, retain) NSString * resource_name;
@property (nonatomic, retain) NSString * resource_img;
@property (nonatomic, retain) NSNumber * resource_type;
@property (nonatomic, retain) NSNumber * per_hour;
@property (nonatomic, retain) NSNumber * monster_id;
@property (nonatomic, retain) NSNumber * monster_num;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSNumber * resource_id;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * map_id;

@end
