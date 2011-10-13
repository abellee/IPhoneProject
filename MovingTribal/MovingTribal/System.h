//
//  System.h
//  MovingTribal
//
//  Created by Lee Abel on 9/30/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

#define SentMessage          @"SentMessage"
#define ReceivedMessage      @"ReceivedMessage"
#define DefaultSound         @"default"

@interface System : NSObject{
	
}

- (void)playSystemSound:(NSString *)soundName;
- (void)vibrate;

@end
