//
//  SoundRecorder.m
//  MovingTribal
//
//  Created by Lee Abel on 9/20/11.
//  Copyright 2011 Abel Lee. All rights reserved.
//

#import "SoundRecorder.h"

@implementation SoundRecorder

@synthesize recorder;
@synthesize player;
@synthesize isInit;

- (id)init
{
    self = [super init];
    if (self) {
        isInit = NO;
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"******| SoundRecorder |***** receive dealloc message!");
    if(isInit){
        [recorder deleteRecording];
        [recorder release];
        recorder = nil;
    }
    if(player) [player release];
}

- (void)prepareRecord
{
    NSLog(@"start recor function enter");
    NSMutableDictionary* recordSetting = [[NSMutableDictionary alloc] initWithCapacity:10];
    [recordSetting setObject:[NSNumber numberWithInt:AVAudioQualityMin] forKey:AVEncoderAudioQualityKey];
    [recordSetting setObject:[NSNumber numberWithInt: kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setObject:[NSNumber numberWithFloat:8000.0] forKey:AVSampleRateKey];
    [recordSetting setObject:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
    [recordSetting setObject:[NSNumber numberWithInt:16] forKey:AVEncoderBitRateKey];
    NSDate *now = [NSDate date];
    NSTimeInterval ms = [now timeIntervalSince1970];
    NSString* fileName = [[NSString alloc] initWithFormat:@"%@/%d.aac", [[NSBundle mainBundle] resourcePath], (int)ms];
    NSLog(@"fileName is %@", fileName);
    NSError* error = nil;
    if(isInit){
        NSLog(@"release recorder");
        [recorder release];
        recorder = nil;
    }
    isInit = YES;
    recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:fileName] settings:recordSetting error:&error];
    [recordSetting release];
    [fileName release];
}

- (void)startRecord
{
    if([recorder prepareToRecord] == YES){
        NSLog(@"start record");
        [recorder record];
    }else{
//        int errorCode = CFSwapInt32HostToBig ([error code]); 
//        NSLog(@"Error: %@ [%4.4s])" , [error localizedDescription], (char*)&errorCode);
    }
}

- (void)stopRecord
{
    NSLog(@"recorder stoped!");
    [recorder setDelegate:self];
    [recorder stop];
    NSLog(@"stop!!!");
}

- (void)playRecord:(NSURL *)url
{
    NSLog(@"play recorder");
    AVAudioSession* session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [session setActive:YES error:nil];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    player.delegate = self;
    [player play];
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)r successfully:(BOOL)flag
{
    NSLog(@"finish recording!");
    [self playRecord: r.url];
    [recorder deleteRecording];
}

- (void)audioRecorderBeginInterruption:(AVAudioRecorder *)recorder
{
    NSLog(@"begin interruption!");
}

- (void)audioRecorderEndInterruption:(AVAudioRecorder *)recorder
{
    NSLog(@"end interruption!");
}

- (void)audioRecorderEndInterruption:(AVAudioRecorder *)recorder withFlags:(NSUInteger)flags
{
    NSLog(@"end interruption withFlags!");
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    int errorCode = CFSwapInt32HostToBig ([error code]); 
    NSLog(@"Encode Error: %@ [%4.4s])" , [error localizedDescription], (char*)&errorCode);
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)p successfully:(BOOL)flag
{
    NSLog(@"finish play sound!");
    [player stop];
    [player release];
    player = nil;
    [recorder release];
    recorder = nil;
    isInit = NO;
}

@end
