//
//  AlarmDBHelper.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/02/07.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "AlarmDBHelper.h"

@implementation AlarmDBHelper
#define DB_PATH @"alarm.db"

- (id) init {
    self = [super init];
    if(self) {
        [self createDatabase];
    }
    return self;
}

- (void) createDatabase {
    //DBファイルのパス
    
    NSString *dir = [self getDBDirectory];
    
    //DBファイルがあるかどうか確認
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:DB_PATH]]) {
        //なければ新規作成
        FMDatabase *db= [self getAlarmDatabase];
        NSString *sql = @"CREATE TABLE T_ALARM (ID INTEGER PRIMARY KEY AUTOINCREMENT,ALARM TEXT UNIQUE, RUN_FLAG TEXT, REPEAT_FLAG TEXT);";
        
        [db open]; //DB開く
        [db executeUpdate:sql]; //SQL実行
        [db close]; //DB閉じる
    }
}

- (NSMutableArray *) selectAll {
    
    FMDatabase* db = [self getAlarmDatabase];
    
    NSString *sql = @"SELECT * FROM t_alarm ORDER BY alarm ASC;";
    [db open];
    FMResultSet *results = [db executeQuery:sql];
    
    NSMutableArray *resultAry = [NSMutableArray array];
    while ([results next]) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:[results stringForColumn:@"id"] forKey:@"ID"];
        [dic setObject:[results stringForColumn:@"alarm"] forKey:@"ALARM"];
        [dic setObject:[results stringForColumn:@"run_flag"] forKey:@"RUN_FLAG"];
        [dic setObject:[results stringForColumn:@"repeat_flag"] forKey:@"REPEAT_FLAG"];
        
        [resultAry addObject:dic];
    }
    
    [db close];
    
    return resultAry;
}

- (BOOL) insert : (NSMutableDictionary *) alarmDic {
    
    FMDatabase* db = [self getAlarmDatabase];
    
    NSString *sql = @"INSERT INTO T_ALARM (ALARM, RUN_FLAG, REPEAT_FLAG) VALUES (?,?,?)";
    [db open];
    [db beginTransaction];
    
    BOOL result = [db executeUpdate:sql,alarmDic[@"ALARM"],alarmDic[@"RUN_FLAG"],alarmDic[@"REPEAT_FLAG"]];

    if(result) {
        [db commit];
    } else {
        [db rollback];
    }
    
    [db close];
    
    return result;
}

- (BOOL) update : (NSMutableDictionary *) alarmDic {
    FMDatabase* db = [self getAlarmDatabase];
    
    NSString *sql = @"UPDATE T_ALARM SET ALARM = ?, RUN_FLAG = ?, REPEAT_FLAG = ? WHERE ID = ?";
    [db open];
    [db beginTransaction];
    
    BOOL result = [db executeUpdate:sql,alarmDic[@"ALARM"],alarmDic[@"RUN_FLAG"],alarmDic[@"REPEAT_FLAG"],alarmDic[@"ID"]];
    
    if(result) {
        [db commit];
    } else {
        [db rollback];
    }
    
    [db close];
    
    return result;
}

- (BOOL) delete : (NSMutableDictionary *) alarmDic {
    FMDatabase* db = [self getAlarmDatabase];
    
    NSString *sql = @"DELETE FROM T_ALARM WHERE ID = ?";
    [db open];
    [db beginTransaction];
    
    BOOL result = [db executeUpdate:sql,alarmDic[@"ID"]];
    
    if(result) {
        [db commit];
    } else {
        [db rollback];
    }
    
    [db close];
    
    return result;
}

- (NSMutableDictionary *) select : (NSInteger) alarmId {
    return [NSMutableDictionary dictionary];
}

- (NSString *) getDBDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    
    return dir;
}

- (FMDatabase *) getAlarmDatabase {
    NSString *writableDBPath = [[self getDBDirectory] stringByAppendingPathComponent:DB_PATH];
    FMDatabase *db = [FMDatabase databaseWithPath:writableDBPath];
    
    return db;
}

@end
