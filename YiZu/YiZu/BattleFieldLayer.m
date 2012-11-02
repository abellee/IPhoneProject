//
//  BattleFieldLayer.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "BattleFieldLayer.h"
#import "Global.h"
#import "UIImage+Overlay.h"

@implementation BattleFieldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	BattleFieldLayer *layer = [BattleFieldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        CCSpriteFrameCache* frameCache0 = [CCSpriteFrameCache sharedSpriteFrameCache];
        [frameCache0 addSpriteFramesWithFile:@"battle_bk.plist" textureFile:@"battle_bk.pvr.ccz"];
        
        background = [CCSprite spriteWithSpriteFrameName:@"battle"];
        [self addChild:background];
        background.position = ccp([background boundingBox].size.width / 2, [background boundingBox].size.height / 2);
        
        CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [frameCache addSpriteFramesWithFile:@"battle_pet.plist" textureFile:@"battle_pet.pvr.ccz"];
        CCSprite* bear0 = [CCSprite spriteWithSpriteFrameName:@"bear0"];
        CCSprite* bear1 = [CCSprite spriteWithSpriteFrameName:@"bear1"];
        
        [self addChild:bear0];
        [self addChild:bear1];
        bear0.position = ccp([background boundingBox].size.width / 2, [background boundingBox].size.height / 2 + 100);
        bear1.position = ccp([background boundingBox].size.width / 2, [background boundingBox].size.height / 2 - 30);
        
        [frameCache0 removeSpriteFramesFromFile:@"battle_bk.plist"];
        [frameCache removeSpriteFramesFromFile:@"battle_pet.plist"];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
