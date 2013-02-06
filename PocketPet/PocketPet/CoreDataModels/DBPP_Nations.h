//
//  DBPP_Nations.h
//  CDGenerator
//
//  Created by Lee Abel on 13-1-16.
//  Copyright (c) 2013年 Lee Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBPP_Nations : NSManagedObject

@property (nonatomic, retain) NSNumber * nation_id;
@property (nonatomic, retain) NSString * nation_name;

@end
