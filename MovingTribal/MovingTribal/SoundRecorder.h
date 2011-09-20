//
//  SoundRecorder.h
//  MovingTribal
//
//  Created by Lee Abel on 9/20/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundRecorder : NSObject<AVAudioRecorderDelegate, AVAudioPlayerDelegate>{
    AVAudioRecorder* recorder;
    AVAudioPlayer* player;
    BOOL isInit;
}

@property (nonatomic, assign) AVAudioRecorder* recorder;
@property (nonatomic, assign) AVAudioPlayer* player;
@property (nonatomic, assign) BOOL isInit;

- (void)stopRecord;
- (void)startRecord;
- (void)prepareRecord;

@end
