//
//  UserDefaultModel.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/31.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "UserDefaultModel.h"

@implementation UserDefaultModel
#define NO_ALARM_MESSAGE @"未設定"

- (id) init {
    
    self = [super init];
    if(self) {
        
        /*
         *  並び替えが必要　まだ作ってない
         */
        
        _userDefaults = [NSUserDefaults standardUserDefaults];
        //test code データ削除
        //[_userDefaults removeObjectForKey:@"AlarmSettings"];
        //[_userDefaults synchronize];
        
        if (![self isUserDefaults]) {
            [self createAlarmUserDefaults];
        }
        _alarmArray = [[_userDefaults objectForKey:@"AlarmSettings"] mutableCopy];
    }
    return self;
}

//アラームを設定
- (void) setAlarmSetting:(NSMutableDictionary *)alarmDic {
    [_alarmArray addObject:alarmDic];
    [_userDefaults setObject:_alarmArray forKey:@"AlarmSettings"];
    [_userDefaults synchronize];
}

//設定したアラームを取得
- (NSMutableArray *) getAlarmSettingAry {
    return _alarmArray;
}

//アラーム保存用のUserDefaultsを作成(初回のみ)
- (void) createAlarmUserDefaults {
    _alarmArray = [NSMutableArray array];
    [_userDefaults setObject:_alarmArray forKey:@"AlarmSettings"];
    [_userDefaults synchronize];
}

//アラームの初期値があるかチェック
- (BOOL) isUserDefaults {
    
    if([_userDefaults objectForKey:@"AlarmSettings"]) {
        return YES;
    }
    return NO;
}

- (NSString *) getAlarm:(NSInteger)indexRow {
    NSString *alarm = ([_alarmArray count] > 0) ? _alarmArray[indexRow][@"alarm"] : NO_ALARM_MESSAGE;
    return alarm;
}

- (NSString *) getRepeat:(NSInteger)indexRow {
    NSString *repeat = ([_alarmArray count] > 0) ? _alarmArray[indexRow][@"repeat"] : [NSString string];
    return repeat;
}

- (NSString *) getFlag:(NSInteger)indexRow {
    NSString *flag = ([_alarmArray count] > 0) ? _alarmArray[indexRow][@"flag"] : @"NO";
    return flag;
}

@end
