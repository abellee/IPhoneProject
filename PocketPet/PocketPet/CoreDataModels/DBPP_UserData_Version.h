//
//  DBPP_UserData_Version.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPP_Bag, DBPP_Formula, DBPP_Relationship, DBPP_ResPoint, DBPP_Storage, DBPP_User_Pet, DBPP_User_Task;

@interface DBPP_UserData_Version : NSManagedObject

@property (nonatomic, retain) NSNumber * uid;
@property (nonatomic, retain) NSNumber * version_id;
@property (nonatomic, retain) NSString * avatar_img;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * storage_num;
@property (nonatomic, retain) NSNumber * bag_num;
@property (nonatomic, retain) NSNumber * birthday;
@property (nonatomic, retain) NSNumber * blood_type;
@property (nonatomic, retain) NSNumber * city;
@property (nonatomic, retain) NSNumber * coin;
@property (nonatomic, retain) NSNumber * constellation;
@property (nonatomic, retain) NSNumber * country;
@property (nonatomic, retain) NSString * hobby;
@property (nonatomic, retain) NSString * job;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSNumber * nation;
@property (nonatomic, retain) NSNumber * pet_num;
@property (nonatomic, retain) NSNumber * province;
@property (nonatomic, retain) NSNumber * resource_num;
@property (nonatomic, retain) NSNumber * sex;
@property (nonatomic, retain) NSString * signature;
@property (nonatomic, retain) NSNumber * telephone;
@property (nonatomic, retain) NSNumber * token;
@property (nonatomic, retain) NSNumber * home_latitude;
@property (nonatomic, retain) NSNumber * home_longitude;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * sina_token;
@property (nonatomic, retain) NSString * sina_access;
@property (nonatomic, retain) NSString * qq_token;
@property (nonatomic, retain) NSString * qq_access;
@property (nonatomic, retain) NSString * renren_token;
@property (nonatomic, retain) NSString * renren_access;
@property (nonatomic, retain) NSNumber * create_time;
@property (nonatomic, retain) NSString * duid;
@property (nonatomic, retain) NSSet *tasks;
@property (nonatomic, retain) NSSet *pets;
@property (nonatomic, retain) NSSet *bag;
@property (nonatomic, retain) NSSet *formula;
@property (nonatomic, retain) NSSet *relationship;
@property (nonatomic, retain) NSSet *res_point;
@property (nonatomic, retain) NSSet *storage;
@end

@interface DBPP_UserData_Version (CoreDataGeneratedAccessors)

- (void)addTasksObject:(DBPP_User_Task *)value;
- (void)removeTasksObject:(DBPP_User_Task *)value;
- (void)addTasks:(NSSet *)values;
- (void)removeTasks:(NSSet *)values;

- (void)addPetsObject:(DBPP_User_Pet *)value;
- (void)removePetsObject:(DBPP_User_Pet *)value;
- (void)addPets:(NSSet *)values;
- (void)removePets:(NSSet *)values;

- (void)addBagObject:(DBPP_Bag *)value;
- (void)removeBagObject:(DBPP_Bag *)value;
- (void)addBag:(NSSet *)values;
- (void)removeBag:(NSSet *)values;

- (void)addFormulaObject:(DBPP_Formula *)value;
- (void)removeFormulaObject:(DBPP_Formula *)value;
- (void)addFormula:(NSSet *)values;
- (void)removeFormula:(NSSet *)values;

- (void)addRelationshipObject:(DBPP_Relationship *)value;
- (void)removeRelationshipObject:(DBPP_Relationship *)value;
- (void)addRelationship:(NSSet *)values;
- (void)removeRelationship:(NSSet *)values;

- (void)addRes_pointObject:(DBPP_ResPoint *)value;
- (void)removeRes_pointObject:(DBPP_ResPoint *)value;
- (void)addRes_point:(NSSet *)values;
- (void)removeRes_point:(NSSet *)values;

- (void)addStorageObject:(DBPP_Storage *)value;
- (void)removeStorageObject:(DBPP_Storage *)value;
- (void)addStorage:(NSSet *)values;
- (void)removeStorage:(NSSet *)values;

@end
