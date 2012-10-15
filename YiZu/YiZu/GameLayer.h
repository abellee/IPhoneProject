//
//  GameLayer.h
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "cocos2d.h"
#import "LoginViewController.h"
#import "RegistLayer.h"
#import "Utils.h"
#import "SystemConfig.h"
#import "ActionLog.h"
#import "PopUpLayer.h"
#import "Global.h"

@interface GameLayer : CCLayer{
    LoginViewController *loginLayer;
    RegistLayer *registLayer;
    int count;
    CCSprite *sprite;
    CCSpriteBatchNode *batchNode;
}
@property (nonatomic, retain) LoginViewController *loginLayer;
@property (nonatomic, retain) RegistLayer *registLayer;
@property (nonatomic, assign) int count;
@property (nonatomic, assign) CCSprite *sprite;
@property (nonatomic, assign) CCSpriteBatchNode *batchNode;

+(CCScene *) scene;
@end
