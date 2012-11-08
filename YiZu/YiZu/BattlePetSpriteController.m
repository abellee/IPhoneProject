//
//  BattlePetSpriteController.m
//  YiZu
//
//  Created by Lee Abel on 12-11-7.
//  Copyright (c) 2012年 Abel. All rights reserved.
//

#import "BattlePetSpriteController.h"
#import "PP_Pet.pb.h"

@implementation BattlePetSpriteController

@synthesize view;
@synthesize data;

-(id)initWithCCSprite:(CCSprite *)petView viewData:(NSObject *)petData
{
    if(self = [super init]){
        [self data:petData];
        [self view:petView];
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"*************| BattlePetSpriteController dealloc message! |*************");
    
    [view release];
    [data release];
    [targetData release];
    
    [super dealloc];
}

@end
