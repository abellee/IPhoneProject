//
//  MapTileConfig.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-18.
//
//

#import "MapTileConfig.h"

@implementation MapTileConfig

@synthesize imageDataIndex, imageDataLength;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

@end
