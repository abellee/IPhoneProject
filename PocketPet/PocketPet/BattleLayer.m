//
//  BattleLayer.m
//  PocketPet
//
//  Created by Lee Abel on 13-5-6.
//
//

#import "BattleLayer.h"
#import "InstanceConfig.h"
#import "Instance.h"
#import "InstanceImages.h"
#import "Global.h"
#import "GameLayer.h"
#import "FileManager.h"

@implementation BattleLayer

@synthesize instanceData;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [instanceData release];
    [enemyList release];
    [petList release];
    
    [super dealloc];
}

- (id)initWithInstance:(Instance *)instance
{
    if (self = [super init]) {
        self.isTouchEnabled = YES;
        [self instanceData:instance];
        CCSprite* background = [CCSprite spriteWithCGImage:instanceData.instanceImages.secondImageData.CGImage key:nil];
        background.anchorPoint = ccp(0, 0);
        [self addChild:background];
        
        enemyList = [[NSMutableArray arrayWithCapacity:0] retain];
        petList = [[NSMutableArray arrayWithCapacity:0] retain];
    }
    return self;
}

- (void)startBatttle
{
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];
    InstanceConfig* config0 = [[Global sharedGlobal] getMainPetConfigByPetId:51];
    InstanceConfig* config1 = [[Global sharedGlobal] getMainPetConfigByPetId:40];
    InstanceConfig* config2 = [[Global sharedGlobal] getMainPetConfigByPetId:31];
    [array addObject:config0];
    [array addObject:config1];
    [array addObject:config2];
    
    NSMutableArray* array0 = [NSMutableArray arrayWithCapacity:0];
    InstanceConfig* configA0 = [[Global sharedGlobal] getPetConfigByPetId:1];
    InstanceConfig* configA1 = [[Global sharedGlobal] getPetConfigByPetId:2];
    InstanceConfig* configA2 = [[Global sharedGlobal] getPetConfigByPetId:3];
    [array0 addObject:configA0];
    [array0 addObject:configA1];
    [array0 addObject:configA2];
    
    FileManager* fileManager = [[FileManager alloc] init];
    [fileManager delegate:self];
    [fileManager getMainPetImagesByPetConfigs:array];
    [fileManager getPetImagesByPetConfigs:array0];
    [fileManager release];
}

- (void)getMainPetImagesComplete:(NSMutableArray *)array
{
    float curPos = 10;
    for (InstanceImages* images in array) {
        CCSprite* sprite = [CCSprite spriteWithCGImage:images.secondImageData.CGImage key:nil];
        sprite.anchorPoint = ccp(0, 0);
        sprite.position = ccp(curPos, 50);
        sprite.scale = 0.5;
        [self addChild:sprite];
        curPos += sprite.boundingBox.size.width + 20;
    }
}

- (void)getPetImagesComplete:(NSMutableArray*)array
{
    float curPos = 10;
    for (InstanceImages* images in array) {
        CCSprite* sprite = [CCSprite spriteWithCGImage:images.firstImageData.CGImage key:nil];
        sprite.anchorPoint = ccp(0, 0);
        sprite.position = ccp(curPos, self.boundingBox.size.height - 150);
        sprite.scale = 0.4;
        [self addChild:sprite];
        curPos += sprite.boundingBox.size.width + 20;
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[[Global sharedGlobal] gameLayer] exitBattleLayer];
}

@end
