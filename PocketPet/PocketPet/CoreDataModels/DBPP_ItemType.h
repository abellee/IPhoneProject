//
//  DBPP_ItemType.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBPP_ItemType : NSManagedObject

@property (nonatomic, retain) NSNumber * item_type;
@property (nonatomic, retain) NSString * type_name;
@property (nonatomic, retain) NSNumber * create_time;

@end
