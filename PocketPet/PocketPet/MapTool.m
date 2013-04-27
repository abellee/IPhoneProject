//
//  MapTool.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-22.
//
//

#import "MapTool.h"
#import "PointSprite.h"
#import "Map.h"
#import "MapTileConfig.h"
#import "SystemConfig.h"

@implementation MapTool

@synthesize delegate;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (void)getCellImageByTilePoints:(NSMutableArray*)points inMap:(Map *)map
{
    if(file == nil) file = [[NSFileHandle fileHandleForReadingAtPath:[[NSBundle mainBundle] pathForResource:map.fileName ofType:@"map"]] retain];
    [self performSelectorInBackground:@selector(read:) withObject:[NSMutableArray arrayWithObjects:points, map, nil]];
}

- (void)read:(NSMutableArray*)data
{
    NSMutableArray* points = [data objectAtIndex:0];
    Map* map = [data objectAtIndex:1];
    for (PointSprite* point in points) {
        if (point.xpos >= map.columnNum || point.xpos < 0 || point.ypos >= map.rowNum || point.ypos < 0) {
            continue;
        }
        int cellIndex = point.xpos + point.ypos * map.rowNum;
        MapTileConfig* mapTileConfig = [[map mapTileConfigArray] objectAtIndex:cellIndex];
        int pos = INFO_LEN + map.rowNum * map.columnNum * sizeof(int) * 2 + mapTileConfig.imageDataIndex;
        [file seekToFileOffset:pos];
        NSData* imageData = [file readDataOfLength:mapTileConfig.imageDataLength];
        UIImage* image = [UIImage imageWithData:imageData];
        point.image = image;
    }
//    [file closeFile];
    [self performSelectorOnMainThread:@selector(readComplete) withObject:nil waitUntilDone:YES];
}

- (void)readComplete
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(readImagesComplete)]) {
        [self.delegate performSelector:@selector(readImagesComplete)];
    }
}

@end
