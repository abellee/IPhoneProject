//
//  RightTopProfile.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-26.
//
//

#import "RightTopProfile.h"
#import "PlayerData.h"
#import "NGNineGridSprite.h"
#import "SystemConfig.h"

@implementation RightTopProfile

@synthesize playerData;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [playerData release];
    
    [super dealloc];
}

- (id)initWithPlayerData:(PlayerData *)data
{
    if (self = [super init]) {
        [self playerData:data];
        
        background = [CCLayerColor layerWithColor:ccc4(100, 100, 100, 1.0) width:100 height:100];
        background.anchorPoint = ccp(0, 0);
        [self addChild:background];
        
        CCLabelTTF* bkLabel = [CCLabelTTF labelWithString:@"背景" fontName:CHINESE_FONT fontSize:16.0];
        [bkLabel setColor:ccc3(0, 0, 0)];
        bkLabel.anchorPoint = ccp(0, 0);
        bkLabel.position = ccp(50, 30);
        [self addChild:bkLabel];
        
        avatar = [[CCLayerColor alloc] init];
        [avatar setColor:ccc3(30, 30, 30)];
        avatar.anchorPoint = ccp(0, 0);
        avatar.position = ccp(10, 10);
        [self addChild:avatar];
        
        CCLabelTTF* avatarLabel = [CCLabelTTF labelWithString:@"头像" fontName:CHINESE_FONT fontSize:16.0];
        [avatarLabel setColor:ccc3(0, 0, 0)];
        avatarLabel.anchorPoint = ccp(0, 0);
        avatarLabel.position = ccp(50, 30);
        [self addChild:avatarLabel];
        
        nicknameLabel = [CCLabelTTF labelWithString:@"昵称: Abel小潴" fontName:CHINESE_FONT fontSize:14.0];
        [nicknameLabel setColor:ccc3(255, 255, 255)];
        nicknameLabel.anchorPoint = ccp(0, 0);
        nicknameLabel.position = ccp(100, 100);
        [self addChild:nicknameLabel];
    }
    return self;
}

@end
