//
//  MapTool.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-22.
//
//

#import <Foundation/Foundation.h>
#import "MapToolDelegate.h"

@class Map;
@interface MapTool : NSObject
{
    NSFileHandle* file;
}

@property (nonatomic, assign, getter = delegate, setter = delegate:) id<MapToolDelegate> delegate;

- (void)getCellImageByTilePoints:(NSMutableArray*)points inMap:(Map *)map;

@end
