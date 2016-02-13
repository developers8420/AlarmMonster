//
//  AlarmModel.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/02/13.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "AlarmModel.h"

@implementation AlarmModel
#define NO_ALARM_MESSAGE @"未設定"

- (void) setAlarmArray:(NSMutableArray *)ary {
    alarmArray = ([ary count] > 0) ? [ary mutableCopy]: [NSMutableArray array];
}

- (NSMutableArray *) getAlarmArray {
    return alarmArray;
}

- (NSMutableDictionary *) getAlarmDic:(NSInteger)indexRow {
    NSMutableDictionary *retDic = ([alarmArray count] > 0) ? alarmArray[indexRow] : [NSMutableDictionary dictionary];
    return retDic;
}

- (NSString *) getId : (NSInteger) indexRow {
    NSString *retId = ([alarmArray count] > 0) ? alarmArray[indexRow][@"ID"] : @"";
    return retId;
}
- (NSString *) getAlarm : (NSInteger) indexRow {
    NSString *retAlarm = ([alarmArray count] > 0) ? alarmArray[indexRow][@"ALARM"] : NO_ALARM_MESSAGE;
    return retAlarm;
}
- (NSString *) getRunFlag : (NSInteger) indexRow {
    NSString *retRunFlag = ([alarmArray count] > 0) ? alarmArray[indexRow][@"RUN_FLAG"] : @"0";
    return retRunFlag;
}
- (NSString *) getRepeatFlag : (NSInteger) indexRow {
    NSString *retRepeatFlag = ([alarmArray count] > 0) ? alarmArray[indexRow][@"REPEAT_FLAG"] : @"0";
    return retRepeatFlag;
}
- (NSString *) getFirstAlarm {
    NSString *retAlarm = [NSString string];
    for (NSDictionary *dic in alarmArray) {
        if([dic[@"RUN_FLAG"] isEqualToString:@"1"]) {
            retAlarm = dic[@"ALARM"];
            return retAlarm;
        }
    }
    return NO_ALARM_MESSAGE;
}

@end
