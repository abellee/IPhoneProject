//
//  InstanceImages.h
//  PocketPet
//
//  Created by Lee Abel on 13-5-6.
//
//

#import <Foundation/Foundation.h>

@interface InstanceImages : NSObject

@property (nonatomic, assign, getter = instanceId, setter = instanceId:) int instanceId;
@property (nonatomic, retain, getter = firstImageData, setter = firstImageData:) UIImage* firstImageData;
@property (nonatomic, retain, getter = secondImageData, setter = secondImageData:) UIImage* secondImageData;

@end
