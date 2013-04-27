//
//  GameLayer.h
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "cocos2d.h"

@class LoginViewController;
@class MainLayerViewController;
@class BattleFieldLayer;
@class PP_BattleInfo;
@class LaunchLoadingViewController;
@class GameSceneLayer;

@interface GameLayer : CCLayer{
    LoginViewController *loginLayer;
    MainLayerViewController* mainLayer;
    LaunchLoadingViewController* launchLoadingViewController;
    int count;
    CCSprite *sprite;
    CCSpriteBatchNode *batchNode;
    
    GameSceneLayer* gameScene;
}
@property (nonatomic, retain, getter = loginLayer, setter = loginLayer:) LoginViewController *loginLayer;
@property (nonatomic, assign, getter = count, setter = count:) int count;
@property (nonatomic, retain, getter = mainLayer, setter = mainLayer:) MainLayerViewController* mainLayer;
@property (nonatomic, assign) CCSprite *sprite;
@property (nonatomic, assign) CCSpriteBatchNode *batchNode;

+(CCScene *) scene;
-(void)loginSuccess;
-(void)onBattleWithBattleInfo:(PP_BattleInfo*)battleInfo;
@end
