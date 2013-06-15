//
//  InstanceConfig.h
//  PocketPet
//
//  Created by Lee Abel on 13-5-4.
//
//

#import <Foundation/Foundation.h>

@interface InstanceConfig : NSObject

@property (nonatomic, assign, getter = instanceId, setter = instanceId:) int instanceId;
@property (nonatomic, copy, getter = instanceName, setter = instanceName:) NSString* instanceName;
@property (nonatomic, assign, getter = dataRange, setter = dataRange:) NSRange dataRange;
@property (nonatomic, assign, getter = battleRange, setter = battleRange:) NSRange battleRange;

@end
