//
//  DBPP_ActionIDs.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBPP_ActionIDs : NSManagedObject

@property (nonatomic, retain) NSString * action_name;
@property (nonatomic, retain) NSNumber * action_id;
@property (nonatomic, retain) NSNumber * create_time;

@end
