//
//  AVManager.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/03/07.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "AVManager.h"

@implementation AVManager

static AVManager *sharedData = nil;

+ (AVManager *)sharedManager{
    @synchronized(self){
        if (!sharedData) {
            sharedData = [[AVManager alloc]init];
            sharedData.player = [[AVAudioPlayer alloc] init];
        }
    }
    return sharedData;
}

- (id)init
{
    self = [super init];
    if (self) {
        soundArray = [[NSMutableArray alloc] init];
        _soundVolume = 1.0;
    }
    return self;
}

- (void)playSound:(NSString *)soundName{
    NSString *soundPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:soundName];
    NSURL *urlOfSound = [NSURL fileURLWithPath:soundPath];
    
    sharedData.player = [[AVAudioPlayer alloc] initWithContentsOfURL:urlOfSound error:nil];
    [sharedData.player setNumberOfLoops:4];
    sharedData.player.volume = _soundVolume;
    sharedData.player.delegate = (id)self;
    [soundArray insertObject:sharedData.player atIndex:0];
    [sharedData.player prepareToPlay];
    [sharedData.player play];
}

- (void)stopSound {
    [sharedData.player stop];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [soundArray removeObject:player];
}

@end
