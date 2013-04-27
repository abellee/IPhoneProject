//
//  PointSprite.h
//  PocketPet
//
//  Created by Lee Abel on 13-4-19.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PointSprite : NSObject

@property (nonatomic, assign, getter = xpos, setter = xpos:) float xpos;
@property (nonatomic, assign, getter = ypos, setter = ypos:) float ypos;
@property (nonatomic, retain, getter = image, setter = image:) UIImage* image;
@property (nonatomic, retain, getter = sprite, setter = sprite:) CCSprite* sprite;

- (void)releaseImage;

@end
