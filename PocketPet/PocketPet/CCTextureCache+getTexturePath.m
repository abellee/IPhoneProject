//
//  CCTextureCache+getTexturePath.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-22.
//
//

#import "CCTextureCache+getTexturePath.h"

@implementation CCTextureCache (getTexturePath)

- (NSString*)getTexturePath:(CCTexture2D *)texture
{
    return [[textures_ allKeysForObject:texture] lastObject];
}

@end
