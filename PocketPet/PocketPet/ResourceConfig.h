//
//  ResourceConfig.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-18.
//
//

#import "MapTileConfig.h"

@interface ResourceConfig : MapTileConfig

@property (nonatomic, assign, getter = subtype, setter = subtype:) int subtype;

@end
