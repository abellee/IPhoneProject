//
//  GameSceneLayer.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-11.
//
//

#import "GameSceneLayer.h"
#import "Map.h"
#import "Global.h"
#import "ResourcePoint.h"
#import "ResourceConfig.h"
#import "PointSprite.h"
#import "CCTextureCache+getTexturePath.h"
#import "MapTool.h"
#import "RightTopProfile.h"

@implementation GameSceneLayer

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        self.isTouchEnabled = YES;

        mapTool = [[MapTool alloc] init];
        mapTool.delegate = self;
        
        curMap = [[Map alloc] init];
        [curMap mapName:@"滨江"];
        [curMap fileName:@"bj"];
        [curMap initData];
        
        mapLayer = [[CCLayer alloc] init];
        objectLayer = [[CCLayer alloc] init];
        playerLayer = [[CCLayer alloc] init];
        uiLayer = [[CCLayer alloc] init];
        [self addChild:mapLayer];
        [self addChild:objectLayer];
        [self addChild:playerLayer];
        [self addChild:uiLayer];
        
        profile = [[RightTopProfile alloc] initWithPlayerData:nil];
        profile.anchorPoint = ccp(0, 0);
        profile.position = ccp(0, [[UIScreen mainScreen] bounds].size.height - 100);
        [uiLayer addChild:profile];
        
//        NSMutableArray* points = [[NSMutableArray arrayWithCapacity:0] retain];
//        for (int i = 0; i < 5; i++) {
//            for (int j = 0; j < 5; j++) {
//                PointSprite* pointSprite = [[PointSprite alloc] init];
//                [pointSprite xpos:i];
//                [pointSprite ypos:j];
//                [points addObject:pointSprite];
//                [pointSprite release];
//            }
//        }
//        [Global getCellImageByTilePoints:points inMap:curMap];
//        for (PointSprite* pointSprite in points) {
//            [self addChild:pointSprite.image];
//            pointSprite.image.position = ccp(pointSprite.xpos * curMap.realWidth, pointSprite.ypos * curMap.realHeight);
//        }
//        locationManager = [[CLLocationManager alloc] init];
//        locationManager.delegate = self;
//        [locationManager startUpdatingLocation];
        int pointX = 0;
        int pointY = 0;
        [self centerMap:CGPointMake(pointX, pointY)];
        [self displayMapByCenterTilePoint:CGPointMake(pointX, pointY)];
    }
    return self;
}

- (void)centerMap:(CGPoint)point
{
    float selfPosX = -point.x * curMap.realWidth + [[UIScreen mainScreen] bounds].size.width / 2;
    float selfPosY = -point.y * curMap.realHeight + [[UIScreen mainScreen] bounds].size.height / 2;
    int mapW = [Global finalWidth:curMap.mapWidth];
    int mapH = [Global finalHeight:curMap.mapHeight];
    if (selfPosX > 0) {
        selfPosX = 0;
    }
    else if(selfPosX < -mapW + [[UIScreen mainScreen] bounds].size.width){
        selfPosX = -mapW + [[UIScreen mainScreen] bounds].size.width;
    }
    if(selfPosY > 0){
        selfPosY = 0;
    }
    else if(selfPosY < -mapH + [[UIScreen mainScreen] bounds].size.height){
        selfPosY = -mapH + [[UIScreen mainScreen] bounds].size.height;
    }
    mapLayer.position = ccp(selfPosX, selfPosY);
}

- (void)displayMapByCenterTilePoint:(CGPoint)point
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    float pointScreenPosX = point.x * curMap.realWidth - abs(mapLayer.position.x);
    float pointScreenPosY = point.y * curMap.realHeight - abs(mapLayer.position.y);
    float rightWidth = screenSize.width - pointScreenPosX - curMap.realWidth;
    float topHeight = screenSize.height - pointScreenPosY - curMap.realHeight;
    int topCellNum = (int)ceil(topHeight / curMap.realHeight);
    int bottomCellNum = (int)ceil(pointScreenPosY / curMap.realHeight);
    int rightCellNum = (int)ceil(rightWidth / curMap.realWidth);
    int leftCellNum = (int)ceil(pointScreenPosX / curMap.realWidth);
    
    int leftIndex = point.x - leftCellNum - 2;
    int rightIndex = point.x + rightCellNum + 2;
    int topIndex = point.y + topCellNum + 2;
    int bottomIndex = point.y - bottomCellNum - 2;
    leftIndex = leftIndex < 0 ? 0 : leftIndex;
    rightIndex = rightIndex > curMap.columnNum ? curMap.columnNum : rightIndex;
    topIndex = topIndex > curMap.rowNum ? curMap.rowNum : topIndex;
    bottomIndex = bottomIndex < 0 ? 0 : bottomIndex;
    if (cellArray == nil) {
        cellArray = [[NSMutableArray arrayWithCapacity:0] retain];
    }
    NSMutableArray* tempArray = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray* pointArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = leftIndex; i < rightIndex; i++) {
        for (int j = bottomIndex; j < topIndex; j++) {
            PointSprite* pointSprite = [self existInList:[NSString stringWithFormat:@"%@%d-%d", MAP_CELL_DEF, i, j]];
            if (pointSprite) {
                [tempArray addObject:pointSprite];
                [cellArray removeObject:pointSprite];
                continue;
            }
            pointSprite = [[PointSprite alloc] init];
            [pointSprite xpos:i];
            [pointSprite ypos:j];
            [pointArray addObject:pointSprite];
            [pointSprite release];
        }
    }
    NSLog(@"cellArray count:%d", [cellArray count]);
    if ([cellArray count]) {
        for (PointSprite* tempSprite in cellArray) {
            NSLog(@"remove:%@", [NSString stringWithFormat:@"%@%d-%d", MAP_CELL_DEF, (int)tempSprite.xpos, (int)tempSprite.ypos]);
            [tempSprite.sprite removeFromParentAndCleanup:YES];
        }
        [cellArray removeAllObjects];
    }
    [cellArray addObjectsFromArray:tempArray];
    [cellArray addObjectsFromArray:pointArray];
    if ([pointArray count]) {
        [mapTool getCellImageByTilePoints:pointArray inMap:curMap];
        NSLog(@"cellArray:%d, pointArray:%d", [cellArray count], [pointArray count]);
    }
}

- (void)readImagesComplete
{
    for (PointSprite* pointSprite in cellArray) {
        if (pointSprite.image) {
            CCSprite* sprite = [CCSprite spriteWithCGImage:pointSprite.image.CGImage key:[NSString stringWithFormat:@"%@%d-%d", MAP_CELL_DEF, (int)pointSprite.xpos, (int)pointSprite.ypos]];
            NSLog(@"%@>>>>>", [NSString stringWithFormat:@"%@%d-%d", MAP_CELL_DEF, (int)pointSprite.xpos, (int)pointSprite.ypos]);
            sprite.anchorPoint = ccp(0, 0);
            pointSprite.sprite = sprite;
            [pointSprite releaseImage];
            [mapLayer addChild:sprite];
            
            CCLabelTTF* label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@%d-%d", MAP_CELL_DEF, (int)pointSprite.xpos, (int)pointSprite.ypos] fontName:@"Marker Felt" fontSize:16.0];
            label.anchorPoint = CGPointZero;
            label.position = CGPointZero;
            [sprite addChild:label];
            
            sprite.position = ccp(pointSprite.xpos * curMap.realWidth, pointSprite.ypos * curMap.realHeight);
        }
    }
}

- (PointSprite*)existInList:(NSString*)path
{
    for (PointSprite* ps in cellArray) {
        CCSprite* sp = ps.sprite;
        if (sp && [[[CCTextureCache sharedTextureCache] getTexturePath:[sp texture]] isEqualToString:path]) {
            return ps;
        }
    }
    return nil;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation* startLocation = [[CLLocation alloc] initWithLatitude:30.14453 longitude:120.12949];
    
    CLLocation* pointHor = [[CLLocation alloc] initWithLatitude:30.14453 longitude:newLocation.coordinate.longitude];
    CLLocationDistance horDis = [startLocation distanceFromLocation:pointHor];
    
    CLLocationDistance verDis = [newLocation distanceFromLocation:pointHor];
    
    float perCell = 119.0;
    float horCellNum = horDis / 2000;
    float horPixelDis = perCell * horCellNum * 5;
    
    float verCellNum = verDis / 2000;
    float verPixelDis = perCell * verCellNum * 5;
    
    float posX = [Global finalX:horPixelDis];
    float posY = [Global finalY:verPixelDis];
    
    UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"163" ofType:@"png"]];
    CCSprite* sprite = [[CCSprite alloc] initWithCGImage:img.CGImage key:nil];
    [mapLayer addChild:sprite];
    sprite.anchorPoint = CGPointZero;
    sprite.position = ccp(posX, posY);
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    lastPoint = [[CCDirector sharedDirector] convertToGL:[touch locationInView:touch.view]];
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint newPoint = [[CCDirector sharedDirector] convertToGL:[touch locationInView:touch.view]];
    CGPoint oldPoint = mapLayer.position;
    mapLayer.position = CGPointMake(mapLayer.position.x + (newPoint.x - lastPoint.x), mapLayer.position.y + (newPoint.y - lastPoint.y));
    if (mapLayer.position.x > 0) {
        mapLayer.position = ccp(0, mapLayer.position.y);
    }
    if (mapLayer.position.y > 0) {
        mapLayer.position = ccp(mapLayer.position.x, 0);
    }
    
    int mapW = [Global finalWidth:curMap.mapWidth];
    int mapH = [Global finalHeight:curMap.mapHeight];
    float screenWidth = [[UIScreen mainScreen] bounds].size.width;
    float screenHeight = [[UIScreen mainScreen] bounds].size.height;
    if (mapLayer.position.x < screenWidth - mapW) {
        mapLayer.position = ccp(screenWidth - mapW, mapLayer.position.y);
    }
    if (mapLayer.position.y < screenHeight - mapH) {
        mapLayer.position = ccp(mapLayer.position.x, screenHeight - mapH);
    }
    totalDistanceX -= newPoint.x - lastPoint.x;
    totalDistanceY -= newPoint.y - lastPoint.y;
    if ((abs(totalDistanceX) >= curMap.realWidth / 4 || abs(totalDistanceY) >= curMap.realHeight / 4) && (oldPoint.x != mapLayer.position.x || oldPoint.y != mapLayer.position.y)) {
        totalDistanceX = 0;
        totalDistanceY = 0;
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        CGPoint p = CGPointMake(mapLayer.position.x + screenSize.width, mapLayer.position.y + screenSize.height);
        CGPoint np = [Global pixelForTile:p inMap:curMap];
        [self displayMapByCenterTilePoint:np];
        NSLog(@"%d>>>>>", [cellArray count]);
    }
    lastPoint = newPoint;
}

@end
