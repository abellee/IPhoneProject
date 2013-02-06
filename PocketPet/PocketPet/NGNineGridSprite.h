//
//  NGNineGridSprite.h
//  Created by Nick Gravelyn
//
//  Distributed under terms of MIT License:
//  http://www.opensource.org/licenses/mit-license.php
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface NGNineGridSprite : CCNode 

- (id)initWithSpriteFrame:(CCSpriteFrame *)frame andCornerSize:(CGSize)cornerSize;
+ (NGNineGridSprite *)spriteWithSpriteFrame:(CCSpriteFrame *)frame andCornerSize:(CGSize)cornerSize;

@end
