//
//  Location.h
//  KeYiDian
//
//  Created by Lee Abel on 13-3-20.
//  Copyright (c) 2013年 KYD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (nonatomic, assign, getter = locationId, setter = locationId:) int locationId;
@property (nonatomic, copy, getter = locationName, setter = locationName:) NSString* locationName;

@end
