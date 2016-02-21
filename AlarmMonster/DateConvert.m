//
//  DateConvert.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/02/20.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "DateConvert.h"

@implementation DateConvert
#define ALARM_FORMAT_STR @"HH:mm"
#define NOWDATE_FORMAT_STR @"yyyy/MM/dd"
#define INTERIM_FORMAT_STR @"yyyy/MM/dd HH:mm:ss"
#define LOCAL @"ja_JP"

//初期化時にFormatの設定をする
- (id) init {
    self = [super init];
    if(self) {
        alarmFormat = [[NSDateFormatter alloc] init];
        nowDateFormat = [[NSDateFormatter alloc] init];
        interimFormat = [[NSDateFormatter alloc] init];
        
        [alarmFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:LOCAL]];
        [nowDateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:LOCAL]];
        [interimFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:LOCAL]];
        
        [alarmFormat setDateFormat:ALARM_FORMAT_STR];
        [nowDateFormat setDateFormat:NOWDATE_FORMAT_STR];
        [interimFormat setDateFormat:INTERIM_FORMAT_STR];
    }
    
    return  self;
}

//成形された日付データを取得
- (NSDate *) getFormatDate:(NSString *)alarmDateStr {

    if([alarmDateStr length] < 5 ) { return nil; }

    //現在の日付を文字に変換
    NSString *nowDateStr = [nowDateFormat stringFromDate:[NSDate date]];
    
    //今日の日付に渡されてきた時間をくっつける
    NSString *interimDateStr = [NSString stringWithFormat:@"%@ %@:00",nowDateStr,alarmDateStr];
    
    //暫定的な日付として保持
    NSDate *interimDate = [interimFormat dateFromString:interimDateStr];
    
    //渡されてきた時間が今の時間より前なら次の日として設定する
    NSDate *compleDate = ([self isTodaysTime:interimDate]) ? interimDate : [self getNextDate:interimDate];
    
    return compleDate;
}

//今日の時間か
- (BOOL) isTodaysTime : (NSDate *) orgDate {
    
    NSComparisonResult result = [[NSDate date] compare:orgDate];
    
    switch (result) {
            
        // 同一時刻
        case NSOrderedSame:
            return YES;
        //未来
        case NSOrderedAscending:
            return YES;
        //過去
        case NSOrderedDescending:
            return NO;
    }
}

//次の日付を取得
- (NSDate *) getNextDate : (NSDate *) interimDate{
    NSDate *compleDate = [interimDate initWithTimeInterval:1*24*60*60 sinceDate:interimDate]; // 1日後
    return compleDate;
}

@end
