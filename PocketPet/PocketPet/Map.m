//
//  Map.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-11.
//
//

#import "Map.h"
#import "ResourceConfig.h"
#import "ResourcePoint.h"
#import "Global.h"
#import "SystemConfig.h"

@implementation Map

@synthesize mapName, mapId, mapWidth, mapHeight, cellWidth, cellHeight, startPoint, mapTileConfigArray, fileName, resPointArray, rowNum, columnNum, pixelPerSegment, metersPerSegment, mapScale;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [mapName release];
    [mapTileConfigArray removeAllObjects];
    [mapTileConfigArray release];
    [resPointArray removeAllObjects];
    [resPointArray release];
    [fileName release];
    
    [super dealloc];
}

- (void)initData
{
    //初始化地图数据
    int mapDataLen = INFO_LEN;
    NSFileHandle* file = [NSFileHandle fileHandleForReadingAtPath:[[NSBundle mainBundle] pathForResource:fileName ofType:@"map"]];
    [file seekToFileOffset:0];
    NSData* data = [file readDataOfLength:mapDataLen];
    float xpos;
    float ypos;
    int width;
    int height;
    int totalWidth;
    int totalHeight;
    int scale;
    int meter;
    int pixel;
    [data getBytes:&xpos range:NSMakeRange(0, sizeof(float))];
    [data getBytes:&ypos range:NSMakeRange(sizeof(float), sizeof(float))];
    [data getBytes:&width range:NSMakeRange(sizeof(float) * 2, sizeof(int))];
    [data getBytes:&height range:NSMakeRange(sizeof(int) + sizeof(float) * 2, sizeof(int))];
    [data getBytes:&totalWidth range:NSMakeRange(sizeof(int) * 2 + sizeof(float) * 2, sizeof(int))];
    [data getBytes:&totalHeight range:NSMakeRange(sizeof(int) * 3 + sizeof(float) * 2, sizeof(int))];
    [data getBytes:&scale range:NSMakeRange(sizeof(int) * 4 + sizeof(float) * 2, sizeof(int))];
    [data getBytes:&pixel range:NSMakeRange(sizeof(int) * 5 + sizeof(float) * 2, sizeof(int))];
    [data getBytes:&meter range:NSMakeRange(sizeof(int) * 6 + sizeof(float) * 2, sizeof(int))];
    int horCell = totalWidth / width;
    int verCell = totalHeight / height;
    
    [self startPoint: CGPointMake(ypos, xpos)];
    [self mapWidth:totalWidth];
    [self mapHeight:totalHeight];
    [self cellWidth:width];
    [self cellHeight:height];
    [self rowNum:verCell];
    [self columnNum:horCell];
    [self pixelPerSegment:pixel];
    [self metersPerSegment:meter];
    [self mapScale:scale];
    [self realWidth:[Global finalWidth:width]];
    [self realHeight:[Global finalHeight:height]];
    
    //初始化地图格子数据
    NSMutableArray* configArray = [NSMutableArray arrayWithCapacity:0];
    int totalCells = horCell * verCell;
    int totalCellsSize = totalCells * 8;
    [file seekToFileOffset: mapDataLen];
    NSData* lenData = [file readDataOfLength:totalCellsSize];
    
    for (int i = 0; i < totalCells; i++) {
        NSData* configData = [lenData subdataWithRange:NSMakeRange(i * 8, 8)];
        int dataIndex;
        int dataLen;
        [configData getBytes:&dataLen range:NSMakeRange(0, 4)];
        [configData getBytes:&dataIndex range:NSMakeRange(4, 4)];
        MapTileConfig* mapTileConfig = [[MapTileConfig alloc] init];
        [mapTileConfig imageDataIndex:dataIndex];
        [mapTileConfig imageDataLength:dataLen];
        [configArray addObject:mapTileConfig];
        [mapTileConfig release];
    }
    [self mapTileConfigArray:configArray];
    [file closeFile];
    
    //初始化地图资源点数据
    NSMutableArray* resArray = [NSMutableArray arrayWithCapacity:0];
    file = [NSFileHandle fileHandleForReadingAtPath:[[NSBundle mainBundle] pathForResource:fileName ofType:@"res"]];
    [file seekToFileOffset:0];
    NSData* resNumData = [file readDataOfLength:4];
    int resNum;
    [resNumData getBytes:&resNum range:NSMakeRange(0, 4)];
    for (int i = 0; i < resNum; i++) {
        [file seekToFileOffset:4 + i * (sizeof(int) * 3 + sizeof(float) * 2)];
        NSData* resData = [file readDataOfLength:sizeof(int) * 3 + sizeof(float) * 2];
        int type;
        int subtype;
        int level;
        float xpos;
        float ypos;
        [resData getBytes:&type range:NSMakeRange(0, sizeof(int))];
        [resData getBytes:&subtype range:NSMakeRange(sizeof(int), sizeof(int))];
        [resData getBytes:&level range:NSMakeRange(sizeof(int) * 2, sizeof(int))];
        [resData getBytes:&xpos range:NSMakeRange(sizeof(int) * 3, sizeof(float))];
        [resData getBytes:&ypos range:NSMakeRange(sizeof(int) * 3 + sizeof(float), sizeof(float))];
        
        ResourcePoint* rp = [[ResourcePoint alloc] init];
        [rp type:type];
        [rp subtype:subtype];
        [rp level:level];
        [rp xpos:xpos];
        [rp ypos:ypos];
        [resArray addObject:rp];
        [rp release];
    }
    [self resPointArray:resArray];
    [file closeFile];
}

@end
