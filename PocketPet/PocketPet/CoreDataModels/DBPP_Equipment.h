//
//  DBPP_Equipment.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_User_Pet;

@interface DBPP_Equipment : NSManagedObject

@property (nonatomic, retain) NSNumber * equip_id;
@property (nonatomic, retain) NSNumber * uid;
@property (nonatomic, retain) NSNumber * pet_id;
@property (nonatomic, retain) NSNumber * equip_level;
@property (nonatomic, retain) NSNumber * version_id;
@property (nonatomic, retain) NSNumber * create_time;
@property (nonatomic, retain) DBPP_User_Pet *pet_data;

@end
