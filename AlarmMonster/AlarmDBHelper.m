//
//  AlarmDBHelper.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/02/07.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "AlarmDBHelper.h"

@implementation AlarmDBHelper
#define DB_PATH @"file.db"

- (id) init {
    self = [super init];
    if(self) {
        [self createDatabase];
    }
    return self;
}

- (void) createDatabase {
    //DBファイルのパス
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir   = [paths objectAtIndex:0];
    
    //DBファイルがあるかどうか確認
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:DB_PATH]])
    {
        //なければ新規作成
        FMDatabase *db= [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:DB_PATH]];
        NSString *sql = @"CREATE TABLE t_alarm (id INTEGER PRIMARY KEY AUTOINCREMENT,alarm TEXT, run_flag TEXT, repeat_flag TEXT);";
        
        [db open]; //DB開く
        [db executeUpdate:sql]; //SQL実行
        [db close]; //DB閉じる
    }
}

- (NSMutableArray *) selectAll {
    FMDatabase* db  = [FMDatabase databaseWithPath:DB_PATH];
    NSString *sql = @"SELECT * FROM t_alarm ORDER BY alarm ASC;";
    [db open];
    FMResultSet *results = [db executeQuery:sql];
    [db close];
    
    NSMutableArray *resultAry = [NSMutableArray array];
    while ([results next]) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:[results stringForColumn:@"id"] forKey:@"ID"];
        [dic setObject:[results stringForColumn:@"alarm"] forKey:@"ALARM"];
        [dic setObject:[results stringForColumn:@"run_flag"] forKey:@"RUN_FLAG"];
        [dic setObject:[results stringForColumn:@"repeat_flag"] forKey:@"REPEAT_FLAG"];
        
        [resultAry addObject:dic];
    }
    
    return resultAry;
}

- (BOOL) insert : (NSMutableDictionary *) alarmDic {
    FMDatabase* db  = [FMDatabase databaseWithPath:DB_PATH];
    //NSString *sql = @"INSERT INTO t_alarm (alarm, run_flag, repeat_flag) VALUES (?,?,?);";
    NSString *sql = @"INSERT INTO t_alarm VALUES (?,?,?)";
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
    return YES;
}

- (BOOL) delete : (NSMutableDictionary *) alarmDic {
    return YES;
}

- (NSMutableDictionary *) select : (NSInteger) alarmId {
    return [NSMutableDictionary dictionary];
}

@end
