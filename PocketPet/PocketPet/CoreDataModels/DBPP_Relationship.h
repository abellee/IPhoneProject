//
//  DBPP_Relationship.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_UserData_Version;

@interface DBPP_Relationship : NSManagedObject

@property (nonatomic, retain) NSNumber * uid;
@property (nonatomic, retain) NSNumber * target_uid;
@property (nonatomic, retain) NSNumber * relationship_type;
@property (nonatomic, retain) NSNumber * create_time;
@property (nonatomic, retain) NSNumber * version_id;
@property (nonatomic, retain) DBPP_UserData_Version *user_data;

@end
