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
#import "NGNineGridSprite.h"
#import "PP_Pet.pb.h"
#import "PP_BattleInfo.pb.h"
#import "PP_BattlePet.pb.h"
#import "PP_GameControl.pb.h"
#import "PP_AttackResult.pb.h"
#import "PP_AttackRes.pb.h"
#import "BattlePetSpriteController.h"
#import "PPCCSprite.h"
#import "SocketManager.h"
#import "State.h"

@implementation BattleFieldLayer

+(CCScene *) sceneWithBattleInfo:(PP_BattleInfo*)battleInfo
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	BattleFieldLayer *layer = [BattleFieldLayer node];
    [layer initWithBattleInfo:battleInfo];
	
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
        
	}
	return self;
}

-(void)initWithBattleInfo:(PP_BattleInfo *)battleInfo
{
    [[Global sharedGlobal] battleField:self];
    curPet = 0;
    totalCount = 30;
    battleInfoData = battleInfo;
    CCSpriteFrameCache* frameCache0 = [CCSpriteFrameCache sharedSpriteFrameCache];
    [frameCache0 addSpriteFramesWithFile:@"battle_bk.plist" textureFilename:@"battle_bk.pvr.ccz"];
    
    background = [PPCCSprite spriteWithSpriteFrameName:@"battle"];
    [self addChild:background];
    background.position = ccp([background boundingBox].size.width / 2, [background boundingBox].size.height / 2);
    
    CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    [frameCache addSpriteFramesWithFile:@"battle_pet.plist" textureFilename:@"battle_pet.pvr.ccz"];
    
    int gap = 10;
    monsterList = [[NSMutableArray arrayWithCapacity:3] retain];
    petList = [[NSMutableArray arrayWithCapacity:3] retain];
    CGFloat monsterYPos = background.boundingBox.size.height / 2 + 100;
    CGFloat petYPos = background.boundingBox.size.height / 2 - 40;
    NSArray* pointList;
    NSArray* petPointList;
    switch ([[battleInfoData autoPets] count]) {
        case 1:{
            CGFloat xpos = background.boundingBox.size.width / 2;
            CGPoint p = CGPointMake(xpos, monsterYPos);
            pointList = [NSArray arrayWithObject:[NSValue valueWithCGPoint:p]];
        }break;
        case 2:{
            CGFloat xpos = background.boundingBox.size.width / 2;
            CGPoint p0 = CGPointMake(xpos - 75, monsterYPos);
            CGPoint p1 = CGPointMake(xpos + 75, monsterYPos);
            pointList = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:p0], [NSValue valueWithCGPoint:p1], nil];
        }break;
        case 3:{
            CGFloat xpos = background.boundingBox.size.width / 2;
            CGPoint p0 = CGPointMake(xpos - 95 - gap, monsterYPos);
            CGPoint p1 = CGPointMake(xpos + 95 + gap, monsterYPos);
            pointList = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:p0], [NSValue valueWithCGPoint:CGPointMake(background.boundingBox.size.width / 2, monsterYPos)], [NSValue valueWithCGPoint:p1], nil];
        }break;
            
        default:
            break;
    }
    
    int battlePetNum = 0;
    for (PP_Pet* battlePet in [[[Global sharedGlobal] player] pets]) {
        if(battlePet.state == FIGHT){
            battlePetNum++;
        }
    }
    
    switch (battlePetNum) {
        case 1:{
            CGFloat xpos = background.boundingBox.size.width / 2;
            CGPoint p = CGPointMake(xpos, petYPos);
            petPointList = [NSArray arrayWithObject:[NSValue valueWithCGPoint:p]];
        }break;
        case 2:{
            CGFloat xpos = background.boundingBox.size.width / 2;
            CGPoint p0 = CGPointMake(xpos - 75, petYPos);
            CGPoint p1 = CGPointMake(xpos + 75, petYPos);
            petPointList = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:p0], [NSValue valueWithCGPoint:p1], nil];
        }break;
        case 3:{
            CGFloat xpos = background.boundingBox.size.width / 2;
            CGPoint p0 = CGPointMake(xpos - 95 - gap, petYPos);
            CGPoint p1 = CGPointMake(xpos + 95 + gap, petYPos);
            petPointList = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:p0], [NSValue valueWithCGPoint:CGPointMake(background.boundingBox.size.width / 2, petYPos)], [NSValue valueWithCGPoint:p1], nil];
        }break;
            
        default:
            break;
    }
    
    for (PP_BattlePet* battleMonster in [battleInfoData autoPets]) {
        PPCCSprite* monster = [PPCCSprite spriteWithSpriteFrameName:@"bear0"];
        if(battleMonster.isVariation == 2){
            UIColor* color = [UIColor redColor];
            switch (battleMonster.variationLevel) {
                case 2:
                    color = [UIColor redColor];
                    break;
                case 3:
                    color = [UIColor blueColor];
                    break;
                case 4:
                    color = [UIColor yellowColor];
                    break;
                    
                default:
                    break;
            }
            monster = (PPCCSprite*)[Global overlayCCSprite:monster color:color];
        }
        [monster addTarget:self action:@selector(monsterTouched:) forControlEvents:UIControlEventTouchUpInside priority:1];
        [monster isTouchable:YES];
        [self addChild:monster z:1];
        
        BattlePetSpriteController* monsterController = [[BattlePetSpriteController alloc] initWithCCSprite:monster viewData:battleMonster];
        
        CGPoint point = [[pointList objectAtIndex:[monsterList count]] CGPointValue];
        monster.position = ccp(point.x, point.y);
        
        int32_t monsterLevel = [battleMonster level];
        CCLabelTTF* monsterNameLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@ LV%d", @"笨笨熊", monsterLevel] dimensions:CGSizeMake(200, 30) hAlignment:kCCTextAlignmentCenter fontName:@"Heiti SC" fontSize:13];
        monsterNameLabel.position = ccp(monster.boundingBox.size.width / 2, monster.boundingBox.size.height + 10);
        [monster addChild:monsterNameLabel];
        [monsterList addObject:monsterController];
        [monsterController release];
    }
    
    for (PP_Pet* battlePet in [[[Global sharedGlobal] player] pets]) {
        if(battlePet.state == FIGHT){
            PPCCSprite* pet = [PPCCSprite spriteWithSpriteFrameName:@"bear1"];
            if(battlePet.isVariation == 2){
                UIColor* color = [UIColor redColor];
                switch (battlePet.variationLevel) {
                    case 2:
                        color = [UIColor redColor];
                        break;
                    case 3:
                        color = [UIColor blueColor];
                        break;
                    case 4:
                        color = [UIColor yellowColor];
                        break;
                        
                    default:
                        break;
                }
                pet = (PPCCSprite*)[Global overlayCCSprite:pet color:color];
            }
            BattlePetSpriteController* petController = [[BattlePetSpriteController alloc] initWithCCSprite:pet viewData:battlePet];
            [self addChild:pet z:1];
            
            CGPoint point = [[petPointList objectAtIndex:[petList count]] CGPointValue];
            pet.position = ccp(point.x, petYPos);
            int32_t petLevel = [battlePet level];
            CCLabelTTF* petNameLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@ LV%d", [battlePet petName], petLevel] dimensions:CGSizeMake(200, 30) hAlignment:kCCTextAlignmentCenter fontName:@"Heiti SC" fontSize:13];
            petNameLabel.position = ccp(pet.boundingBox.size.width / 2, pet.boundingBox.size.height + 10);
            [pet addChild:petNameLabel];
            [petList addObject:petController];
            [petController release];
        }
    }
    
    //CGFloat bearHeight = bear0.boundingBox.size.height;
    
    /*CCSpriteFrameCache* frameCache1 = [CCSpriteFrameCache sharedSpriteFrameCache];
     [frameCache1 addSpriteFramesWithFile:@"battle_item.plist" textureFile:@"battle_item.pvr.ccz"];
     CCSprite* tempBloodSprite = [CCSprite spriteWithSpriteFrameName:@"HP"];
     NGNineGridSprite* bloodSprite = [NGNineGridSprite spriteWithSpriteFrame:tempBloodSprite.displayedFrame andCornerSize:CGSizeMake(5, 7)];
     bloodSprite.anchorPoint = CGPointMake(0, 0.5);
     bloodSprite.contentSize = CGSizeMake(60, 10);
     
     CCSprite* tempManaSprite = [CCSprite spriteWithSpriteFrameName:@"MP"];
     manaSprite = [NGNineGridSprite spriteWithSpriteFrame:tempManaSprite.displayedFrame andCornerSize:CGSizeMake(5, 7)];
     manaSprite.anchorPoint = CGPointMake(0, 0.5);
     manaSprite.contentSize = CGSizeMake(60, 10);
     
     bloodSprite.position = ccp(bear0.boundingBox.size.width / 2 - bloodSprite.contentSize.width / 2, bearHeight + bloodSprite.contentSize.height / 2 + 5);
     manaSprite.position = ccp(bear0.boundingBox.size.width / 2 - manaSprite.contentSize.width / 2, bearHeight + bloodSprite.boundingBox.size.height / 2 + 5);
     [bear1 addChild:bloodSprite];
     [bear1 addChild:manaSprite];*/
    
    [frameCache0 removeSpriteFramesFromFile:@"battle_bk.plist"];
    [frameCache removeSpriteFramesFromFile:@"battle_pet.plist"];
    //[frameCache1 removeSpriteFramesFromFile:@"battle_item.plist"];
    
    readyCount = [CCLabelTTF labelWithString:@"30" dimensions:CGSizeMake(200, 30) hAlignment:kCCTextAlignmentCenter fontName:@"Heiti SC" fontSize:20];
    [self addChild:readyCount];
    readyCount.position = ccp(background.boundingBox.size.width / 2, background.boundingBox.size.height / 2);
    
    [self startTime];
}

-(void)startTime
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showReadyCount) userInfo:nil repeats:YES];
    [timer fire];
}

-(void)showReadyCount
{
    totalCount--;
    if(totalCount <= 0){
        NSLog(@"time is up!");
        [timer invalidate];
        if([readyCount visible]) [readyCount setVisible:NO];
        return;
    }
    [readyCount setString:[NSString stringWithFormat:@"%d", totalCount]];
}

-(void)monsterTouched:(PPCCSprite*)target
{
    for (BattlePetSpriteController* controller in monsterList) {
        if([controller.view isEqual:target]){
            [[petList objectAtIndex:curPet] targetData:controller.data];
            curPet++;
            NSLog(@"%d-----%d", curPet, petList.count);
            if(curPet >= petList.count){
                [self targetMonsterSelected];
            }
        }
    }
}

-(void)randomChoose
{
    curPet = 0;
    for (BattlePetSpriteController* petController in petList) {
        if (petController.targetData == nil) {
            int i = arc4random() % [monsterList count];
            BattlePetSpriteController* monsterController = (BattlePetSpriteController*)[monsterList objectAtIndex:i];
            if(monsterController){
                [petController targetData: monsterController.data];
            }
        }
    }
    [self targetMonsterSelected];
}

-(void)targetMonsterSelected
{
    curPet = 0;
    [timer invalidate];
    [readyCount setVisible:NO];
    [readyCount setString:[NSString stringWithFormat:@"%d", 30]];
    totalCount = 30;
    [self untouchableMonsterAndPet];
    [[[Global sharedGlobal] socketManager] attackStartWithNSArray:petList];
}

-(void)untouchableMonsterAndPet
{
    for (BattlePetSpriteController* petController in petList) {
        PPCCSprite* petView = (PPCCSprite*)petController.view;
        if (petView) {
            [petView isTouchable:NO];
        }
    }
    
    for (BattlePetSpriteController* monsterController in monsterList) {
        PPCCSprite* monsterView = (PPCCSprite*)monsterController.view;
        if (monsterView) {
            [monsterView isTouchable:NO];
        }
    }
}

-(void)retouchableMonsterAndPet
{
    for (BattlePetSpriteController* petController in petList) {
        PPCCSprite* petView = (PPCCSprite*)petController.view;
        if (petView) {
            [petView isTouchable:YES];
        }
    }
    
    for (BattlePetSpriteController* monsterController in monsterList) {
        PPCCSprite* monsterView = (PPCCSprite*)monsterController.view;
        if (monsterView) {
            [monsterView isTouchable:YES];
        }
    }
}

-(void)clearPetTargetData
{
    for (BattlePetSpriteController* petController in petList) {
        [petController targetData:nil];
    }
}

-(void)attackResultWithPPAttackResult:(PP_AttackResult *)attackResult
{
    for (PP_AttackRes* attackRes in [attackResult attackRes]) {
        for (int i=0; i<monsterList.count; i++) {
            BattlePetSpriteController* monsterController = [monsterList objectAtIndex:i];
            PP_BattlePet* battleMonster = (PP_BattlePet*)monsterController.data;
            if(battleMonster.mid == [[attackRes gameControl] targetId] && [[attackRes gameControl] dead] == 2){
                [self removeChild:monsterController.view cleanup:YES];
                [monsterList removeObject:monsterController];
                --i;
            }else{
                if(loseBlood == nil){
                    loseBlood = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"-%d", [[attackRes gameControl] hp]] dimensions:CGSizeMake(100, 30) hAlignment:kCCTextAlignmentCenter fontName:@"Heiti SC" fontSize:30];
                }
                [loseBlood setString:[NSString stringWithFormat:@"-%d", [[attackRes gameControl] hp]]];
                if([loseBlood parent] == nil){
                    [self addChild:loseBlood];
                }
                loseBlood.position = ccp(monsterController.view.position.x, monsterController.view.position.y);
            }
        }
        NSLog(@"攻击成功与否:%d 怪物ID:%d 受到%d点伤害 伤害它的宠物ID是%d 死没死%d", [[attackRes gameControl] success], [[attackRes gameControl] targetId], [[attackRes gameControl] hp], [[attackRes gameControl] petId], [[attackRes gameControl] dead]);
    }
    [self clearPetTargetData];
    [self retouchableMonsterAndPet];
    [readyCount setVisible:YES];
    [self startTime];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    NSLog(@"*********| %s dealloc message! |*********", object_getClassName(self));
    
	[super dealloc];
}
@end
