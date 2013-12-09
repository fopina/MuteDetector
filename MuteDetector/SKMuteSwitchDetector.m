//
//  SKMuteSwitchDetector.m
//
//  Created by Filipe on 09/12/13.
//  Copyright (c) 2013 skmobi. All rights reserved.
//
//  Adapted from SKMuteSwitchDetector by Moshe Gottlieb (Sharkfood) @ http://sharkfood.com/archives/450
//  All credits to him

#import "SKMuteSwitchDetector.h"
#import <AudioToolbox/AudioToolbox.h>


void MuteSoundPlaybackComplete(SystemSoundID  ssID,void* clientData){

    NSDictionary *soundData = CFBridgingRelease(clientData);
    SKMuteSwitchDetectorBlock andPerform = soundData[@"andPerform"];
    SystemSoundID soundId = [soundData[@"soundId"] integerValue];

    NSTimeInterval elapsed = [NSDate timeIntervalSinceReferenceDate] - [soundData[@"start"] doubleValue];
    andPerform(YES, elapsed < 0.2);
    
    AudioServicesRemoveSystemSoundCompletion(soundId);
    AudioServicesDisposeSystemSoundID(soundId);
}

@implementation SKMuteSwitchDetector

+ (void)checkSwitch:(SKMuteSwitchDetectorBlock)andPerform {
    if (!andPerform) return;

    NSURL* url = [[NSBundle mainBundle] URLForResource:@"mute" withExtension:@"caf"];
    SystemSoundID soundId;

    if (AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundId) == kAudioServicesNoError){
        UInt32 yes = 1;
        AudioServicesSetProperty(kAudioServicesPropertyIsUISound, sizeof(soundId),&soundId,sizeof(yes), &yes);
        
        NSDictionary *clientData = @{@"andPerform" : [andPerform copy], @"soundId" : @(soundId), @"start" : @([NSDate timeIntervalSinceReferenceDate])};
        AudioServicesAddSystemSoundCompletion(soundId, CFRunLoopGetMain(), kCFRunLoopDefaultMode, MuteSoundPlaybackComplete,(void *)CFBridgingRetain(clientData));

        AudioServicesPlaySystemSound(soundId);
    } else {
        andPerform(NO, NO);
    }
}

@end
