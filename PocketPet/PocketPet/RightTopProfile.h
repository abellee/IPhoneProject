//
//  RightTopProfile.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-26.
//
//

#import "cocos2d.h"

@class PlayerData;
@class NGNineGridSprite;
@interface RightTopProfile : CCLayer
{
    CCLayerColor* background;
    CCLayerColor* avatar;
    
    CCLabelTTF* nicknameLabel;
    CCLabelTTF* levelLabel;
    CCLabelTTF* expLabel;
    
    NGNineGridSprite* exp;
}

@property (nonatomic, retain, getter = playerData, setter = playerData:) PlayerData* playerData;

- (id)initWithPlayerData:(PlayerData*)data;

@end
