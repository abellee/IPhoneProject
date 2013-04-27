//
//  MapTileConfig.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-18.
//
//

#import <Foundation/Foundation.h>

@interface MapTileConfig : NSObject

@property (nonatomic, assign, getter = imageDataIndex, setter = imageDataIndex:) int imageDataIndex;
@property (nonatomic, assign, getter = imageDataLength, setter = imageDataLength:) int imageDataLength;

@end
