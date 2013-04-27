//
//  PointSprite.m
//  PocketPet
//
//  Created by Lee Abel on 13-4-19.
//
//

#import "PointSprite.h"

@implementation PointSprite

@synthesize xpos, ypos, image, sprite;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    if(image != nil) [image release];
    [sprite release];
    
    [super dealloc];
}

- (void)releaseImage
{
    [image release];
    image = nil;
}

@end
