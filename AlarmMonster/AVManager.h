//
//  AVManager.h
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/03/07.
//  Copyright © 2016年 developers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AVManager : NSObject {
    NSMutableArray *soundArray;
}

@property (nonatomic) float soundVolume;
@property (nonatomic) AVAudioPlayer *player;
+ (AVManager *)sharedManager;
- (void)playSound:(NSString *)soundName;
- (void)stopSound;
@end
