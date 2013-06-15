//
//  InstanceLayer.m
//  PocketPet
//
//  Created by Lee Abel on 13-5-6.
//
//

#import "InstanceLayer.h"
#import "Instance.h"
#import "FileManager.h"
#import "InstanceImages.h"
#import "Global.h"
#import "GameLayer.h"

@implementation InstanceLayer

@synthesize instanceData;

- (void)dealloc
{
    NSLog(@"****************** %s dealloc!! **********************", object_getClassName(self));
    
    [instanceData release];
    
    [super dealloc];
}

- (id)initWithInstance:(Instance *)instance
{
    if (self = [super init]) {
        self.isTouchEnabled = YES;
        [self instanceData:instance];
        CCSprite* background = [CCSprite spriteWithCGImage:instanceData.instanceImages.firstImageData.CGImage key:nil];
        background.anchorPoint = ccp(0, 0);
        [self addChild:background];
    }
    return self;
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[[Global sharedGlobal] gameLayer] enterBattleLayer];
}

@end
