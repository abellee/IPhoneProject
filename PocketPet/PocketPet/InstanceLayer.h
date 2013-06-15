//
//  InstanceLayer.h
//  PocketPet
//
//  Created by Lee Abel on 13-5-6.
//
//

#import "cocos2d.h"

@class Instance;
@interface InstanceLayer : CCLayer

@property (nonatomic, retain, getter = instanceData, setter = instanceData:) Instance* instanceData;

- (id)initWithInstance:(Instance*)config;

@end
