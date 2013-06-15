//
//  Instance.h
//  PocketPet
//
//  Created by Lee Abel on 13-5-4.
//
//

#import <Foundation/Foundation.h>

@class InstanceImages;
@interface Instance : NSObject

@property (nonatomic, assign, getter = instanceId, setter = instanceId:) int instanceId;
@property (nonatomic, copy, getter = instanceName, setter = instanceName:) NSString* instanceName;
@property (nonatomic, retain, getter = instanceImages, setter = instanceImages:) InstanceImages* instanceImages;

@end
