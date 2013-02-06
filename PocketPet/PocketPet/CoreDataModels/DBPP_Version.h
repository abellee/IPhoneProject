//
//  DBPP_Version.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBPP_Version : NSManagedObject

@property (nonatomic, retain) NSNumber * task_last_version;
@property (nonatomic, retain) NSNumber * item_last_version;
@property (nonatomic, retain) NSNumber * pet_last_version;
@property (nonatomic, retain) NSNumber * res_last_version;

@end
