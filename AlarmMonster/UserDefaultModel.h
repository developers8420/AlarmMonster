//
//  UserDefaultModel.h
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/31.
//  Copyright © 2016年 developers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultModel : NSObject
@property NSUserDefaults *userDefaults;
@property NSMutableArray *alarmArray;

- (void) setAlarmSetting : (NSMutableDictionary *) alarmDic;
- (NSMutableArray *) getAlarmSettingAry;
- (NSString *) getAlarm : (NSInteger) indexRow;
- (NSString *) getRepeat : (NSInteger) indexRow;
- (NSString *) getFlag:(NSInteger)indexRow;
@end
