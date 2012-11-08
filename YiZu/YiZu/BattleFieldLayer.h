//
//  BattleFieldLayer.h
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class NGNineGridSprite;
@class PP_BattleInfo;
@class PP_AttackResult;
@class PPCCSprite;
@interface BattleFieldLayer : CCLayer{
    PPCCSprite* background;
    PP_BattleInfo* battleInfoData;
    NSMutableArray* monsterList;
    NSMutableArray* petList;
    NSTimer* timer;
    CCLabelTTF* readyCount;
    int curPet;
    int totalCount;
}

+(CCScene *) sceneWithBattleInfo:(PP_BattleInfo*)battleInfo;
-(void)initWithBattleInfo:(PP_BattleInfo*)battleInfo;
-(void)attackResultWithPPAttackResult:(PP_AttackResult*)attackResult;

@end
