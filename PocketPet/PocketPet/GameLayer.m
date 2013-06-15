//
//  GameLayer.m
//  YiZu
//
//  Created by Abel Lee on 12-6-28.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "GameLayer.h"
#import "LoginViewController.h"
#import "MainLayerViewController.h"
#import "Utils.h"
#import "SystemConfig.h"
#import "ActionLog.h"
#import "PopUpLayer.h"
#import "Global.h"
#import "SocketManager.h"
#import "BattleFieldLayer.h"
#import "LaunchLoadingViewController.h"
#import "SocialShareViewController.h"
#import "GameSceneLayer.h"
#import "InstanceLayer.h"
#import "Instance.h"
#import "InstanceConfig.h"
#import "InstanceImages.h"
#import "FileManager.h"
#import "BattleLayer.h"

#import "PP_CLUser.pb.h"

@implementation GameLayer

@synthesize loginLayer;
@synthesize mainLayer;
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
	if( (self = [super init])) {
        PopUpLayer *popUpLayer = [[PopUpLayer alloc] init];
        UIView *popUpLayerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[Global sharedGlobal] totalWidth], [[Global sharedGlobal] totalHeight])];
        popUpLayerView.multipleTouchEnabled = NO;
        popUpLayerView.userInteractionEnabled = NO;
        [popUpLayer setView:popUpLayerView];
        [[[CCDirector sharedDirector] view] addSubview:popUpLayerView];
        [[Global sharedGlobal] popUpLayer:popUpLayer];
        [popUpLayerView release];
        popUpLayerView = nil;
        
        [[Global sharedGlobal] gameLayer:self];
        launchLoadingViewController = [[LaunchLoadingViewController alloc] init];
        [[[CCDirector sharedDirector] view] insertSubview:launchLoadingViewController.view atIndex:0];
	}
	return self;
}

- (void)enterGame
{
    loginLayer = [[LoginViewController alloc] init];
    [[[CCDirector sharedDirector] view] insertSubview:loginLayer.view atIndex:0];
    
    [[Global sharedGlobal] socketManager:[[SocketManager alloc] init]];
    [[[Global sharedGlobal] socketManager] connect];
    
    [launchLoadingViewController.view removeFromSuperview];
    [launchLoadingViewController release];
    launchLoadingViewController = nil;
    
    //SocialShareViewController* socialShareViewController = [[SocialShareViewController alloc] initWithBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"share_bk" ofType:@"png"]] text:@"同学们，我在口袋宠物里打到了一张神兵利器的配方啊，爽呆了啊~~你们也来玩吧~~~"];
    //[[[CCDirector sharedDirector] view] addSubview:socialShareViewController.view];
    
//    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
//    
//    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:10];
}

-(void)loginSuccess
{
    NSLog(@"%@#####%d", [[[Global sharedGlobal] player] nickname], [[[Global sharedGlobal] player] uid]);
    [loginLayer.view removeFromSuperview];
    [loginLayer release];
    loginLayer = nil;
    
//    mainLayer = [[MainLayerViewController alloc] init];
//    [[[CCDirector sharedDirector] view] insertSubview:mainLayer.view atIndex:0];
    gameScene = [[GameSceneLayer alloc] init];
    [self addChild:gameScene];
    
    InstanceConfig* config = [[Global sharedGlobal] getInstanceConfigByInstanceId:2];
    FileManager* fileManager = [[FileManager alloc] init];
    [fileManager delegate:self];
    [fileManager getInstanceImagesByInstanceConfig:config];
    [fileManager release];
}

- (void)enterBattleLayer
{
    CCScene* scene = [CCScene node];
    battleLayer = [[BattleLayer alloc] initWithInstance:instanceLayer.instanceData];
    [battleLayer startBatttle];
    [scene addChild:battleLayer];
    
    CCTransitionTurnOffTiles* transitionScene = [CCTransitionTurnOffTiles transitionWithDuration:0.5 scene:scene];
    [[CCDirector sharedDirector] pushScene:transitionScene];
}

- (void)exitBattleLayer
{
    [[CCDirector sharedDirector] popToRootScene];
    [battleLayer release];
    battleLayer = nil;
}

- (void)getInstanceImageComplete:(InstanceImages *)images
{
    return;
    InstanceConfig* config = [[Global sharedGlobal] getInstanceConfigByInstanceId:images.instanceId];
    Instance* instance = [[Instance alloc] init];
    [instance instanceId:images.instanceId];
    [instance instanceName:config.instanceName];
    [instance instanceImages:images];
    instanceLayer = [[InstanceLayer alloc] initWithInstance:instance];
    [self addChild:instanceLayer];
    [instance release];
}

-(void)onBattleWithBattleInfo:(PP_BattleInfo *)battleInfo
{
    [[mainLayer view] setHidden:YES];
    [self addChild:[BattleFieldLayer sceneWithBattleInfo:battleInfo]];
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
    [cache addSpriteFramesWithFile:plistName textureFilename:cczName];
    
    batchNode = [CCSpriteBatchNode batchNodeWithFile:cczName];
    [self addChild:batchNode];
    CCArray *spriteFrames = [CCArray arrayWithCapacity:totalFrame];
    for(int i=0; i<totalFrame; i++){
        NSString *frameName = [NSString stringWithFormat:@"%d%@", i+1, @".png"];
        CCSpriteFrame *frame = [cache spriteFrameByName:frameName];
        [spriteFrames addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:[spriteFrames getNSArray] delay:0.1];
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
