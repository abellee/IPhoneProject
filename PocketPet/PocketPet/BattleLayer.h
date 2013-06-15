//
//  BattleLayer.h
//  PocketPet
//
//  Created by Lee Abel on 13-5-6.
//
//

#import "cocos2d.h"
#import "FileManagerDelegate.h"

@class Instance;
@interface BattleLayer : CCLayer<FileManagerDelegate>
{
    NSMutableArray* enemyList;
    NSMutableArray* petList;
}

@property (nonatomic, retain, getter = instanceData, setter = instanceData:) Instance* instanceData;

- (id)initWithInstance:(Instance*)config;
- (void)startBatttle;

@end
