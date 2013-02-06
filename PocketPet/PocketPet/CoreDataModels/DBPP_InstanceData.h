//
//  DBPP_InstanceData.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_Instance;

@interface DBPP_InstanceData : NSManagedObject

@property (nonatomic, retain) NSNumber * instance_id;
@property (nonatomic, retain) NSNumber * gate_num;
@property (nonatomic, retain) NSNumber * monster_id;
@property (nonatomic, retain) NSNumber * monster_level;
@property (nonatomic, retain) NSNumber * monster_num;
@property (nonatomic, retain) NSNumber * total_gate;
@property (nonatomic, retain) DBPP_Instance *instance;

@end
