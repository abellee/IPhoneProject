//
//  GameSceneLayer.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-11.
//
//

#import <CoreLocation/CoreLocation.h>
#import "cocos2d.h"
#import "MapToolDelegate.h"

@class Map;
@class MapTool;
@class RightTopProfile;
@interface GameSceneLayer : CCLayer<CLLocationManagerDelegate, MapToolDelegate>
{
    Map* curMap;
    CGPoint lastPoint;
    CLLocationManager* locationManager;
    float totalDistanceX;
    float totalDistanceY;
    MapTool* mapTool;
    NSMutableArray* cellArray;
    
    CCLayer* mapLayer;
    CCLayer* uiLayer;
    CCLayer* objectLayer;
    CCLayer* playerLayer;
    
    RightTopProfile* profile;
}

@end
