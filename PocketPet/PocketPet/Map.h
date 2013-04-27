//
//  Map.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-11.
//
//

#import <Foundation/Foundation.h>

@interface Map : NSObject

@property (nonatomic, copy, getter = mapName, setter = mapName:) NSString* mapName;
@property (nonatomic, copy, getter = fileName, setter = fileName:) NSString* fileName;
@property (nonatomic, assign, getter = mapId, setter = mapId:) int mapId;
@property (nonatomic, assign, getter = mapWidth, setter = mapWidth:) int mapWidth;
@property (nonatomic, assign, getter = mapHeight, setter = mapHeight:) int mapHeight;
@property (nonatomic, assign, getter = cellWidth, setter = cellWidth:) int cellWidth;
@property (nonatomic, assign, getter = cellHeight, setter = cellHeight:) int cellHeight;
@property (nonatomic, assign, getter = rowNum, setter = rowNum:) int rowNum;
@property (nonatomic, assign, getter = columnNum, setter = columnNum:) int columnNum;
@property (nonatomic, assign, getter = startPoint, setter = startPoint:) CGPoint startPoint;
@property (nonatomic, assign, getter = pixelPerSegment, setter = pixelPerSegment:) int pixelPerSegment;
@property (nonatomic, assign, getter = metersPerSegment, setter = metersPerSegment:) int metersPerSegment;
@property (nonatomic, assign, getter = mapScale, setter = mapScale:) int mapScale;
@property (nonatomic, retain, getter = mapTileConfigArray, setter = mapTileConfigArray:) NSMutableArray* mapTileConfigArray;
@property (nonatomic, retain, getter = resPointArray, setter = resPointArray:) NSMutableArray* resPointArray;
@property (nonatomic, assign, getter = realWidth, setter = realWidth:) float realWidth;
@property (nonatomic, assign, getter = realHeight, setter = realHeight:) float realHeight;

- (void)initData;

@end
