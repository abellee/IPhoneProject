//
//  DBPP_Instance.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_InstanceData;

@interface DBPP_Instance : NSManagedObject

@property (nonatomic, retain) NSString * instance_name;
@property (nonatomic, retain) NSNumber * require_level;
@property (nonatomic, retain) NSNumber * require_num;
@property (nonatomic, retain) NSNumber * require_task;
@property (nonatomic, retain) NSNumber * require_element;
@property (nonatomic, retain) NSSet *instance_data;
@end

@interface DBPP_Instance (CoreDataGeneratedAccessors)

- (void)addInstance_dataObject:(DBPP_InstanceData *)value;
- (void)removeInstance_dataObject:(DBPP_InstanceData *)value;
- (void)addInstance_data:(NSSet *)values;
- (void)removeInstance_data:(NSSet *)values;

@end
