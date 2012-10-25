//
//  GameLayer.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "GameLayer.h"
#import "LoginViewController.h"
#import "Utils.h"
#import "SystemConfig.h"
#import "ActionLog.h"
#import "PopUpLayer.h"
#import "Global.h"
#import "SocketManager.h"

@implementation GameLayer

@synthesize loginLayer;
@synthesize count;
@synthesize sprite;
@synthesize batchNode;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
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
        loginLayer = [[LoginViewController alloc] init];
        [[[CCDirector sharedDirector] openGLView] insertSubview:loginLayer.view atIndex:0];
        
        PopUpLayer *popUpLayer = [[PopUpLayer alloc] init];
        UIView *popUpLayerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TOTLE_WIDTH, TOTLE_HEIGHT)];
        popUpLayerView.multipleTouchEnabled = NO;
        popUpLayerView.userInteractionEnabled = NO;
        [popUpLayer setView:popUpLayerView];
        [[[CCDirector sharedDirector] openGLView] addSubview:popUpLayerView];
        [[Global sharedGlobal] popUpLayer:popUpLayer];
        [[Global sharedGlobal] socketManager:[[SocketManager alloc] init]];
        [[Global sharedGlobal] gameLayer:self];
        
        [[[Global sharedGlobal] socketManager] connect];
        [popUpLayerView release];
        popUpLayerView = nil;
        
//        self.isTouchEnabled = YES;
	}
	return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(count == 2){
        [sprite removeFromParentAndCleanup:YES];
        sprite = nil;
        [batchNode removeFromParentAndCleanup:YES];
        batchNode = nil;
        [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
        [[CCDirector sharedDirector] purgeCachedData];
    }
    int totalFrame = 36;
    float ypos = 400;
    NSString *plistName = @"bear.plist";
    NSString *cczName = @"bear.pvr.ccz";
    if(count == 1){
        totalFrame = 14;
        plistName = @"fight.plist";
        cczName = @"fight.pvr.ccz";
        ypos = 200;
    }
    CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
    [cache addSpriteFramesWithFile:plistName textureFile:cczName];
    
    batchNode = [CCSpriteBatchNode batchNodeWithFile:cczName];
    [self addChild:batchNode];
    CCArray *spriteFrames = [CCArray arrayWithCapacity:totalFrame];
    for(int i=0; i<totalFrame; i++){
        NSString *frameName = [NSString stringWithFormat:@"%d%@", i+1, @".png"];
        CCSpriteFrame *frame = [cache spriteFrameByName:frameName];
        [spriteFrames addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithFrames:[spriteFrames getNSArray] delay:0.1];
    CCActionInterval *action = [CCAnimate actionWithAnimation:animation];
    sprite = [CCSprite spriteWithSpriteFrame:(CCSpriteFrame *)[spriteFrames objectAtIndex:0]];
    [sprite runAction:[CCRepeatForever actionWithAction:action]];
    [sprite setPosition:CGPointMake(160, ypos)];
    [batchNode addChild:sprite];
    [cache removeSpriteFrameByName:plistName];
    if(count == 0){
        count++;
    }else{
        count = 0;
    }
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
