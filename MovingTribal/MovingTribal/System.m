//
//  System.m
//  MovingTribal
//
//  Created by Lee Abel on 9/30/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "System.h"

@implementation System

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)playSystemSound:(NSString *)soundName
{
	SystemSoundID soundId;
	NSURL *filePath   = [[NSBundle mainBundle] URLForResource:soundName withExtension: @"caf"];
	AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundId);
	AudioServicesPlaySystemSound(soundId);
}

- (void)vibrate
{
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
