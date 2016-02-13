//
//  AlarmSettingViewController.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/30.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "AlarmSettingViewController.h"

@interface AlarmSettingViewController ()

@end

@implementation AlarmSettingViewController {
    UIDatePicker *datePicker;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = BACK_COLOR;

    _helper = [[AlarmDBHelper alloc] init];

    //ピッカー
    CGRect pickerRect = CGRectMake(self.defaultX, self.defaultY, self.defaultWidth, self.defaultHeight - 70);
    datePicker = [[UIDatePicker alloc] initWithFrame:pickerRect];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.backgroundColor = DEFAULT_COLOR;
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    [self.view addSubview:datePicker];

    //決定ボタン
    CGRect resultRect = CGRectMake(self.defaultX, self.defaultY + datePicker.frame.size.height + 10, self.defaultWidth, 60);
    UIButton *resultBtn = [OrgButton planeButton:resultRect text:@"決定" delegate:self action:@selector(result) tag:200];
    resultBtn.backgroundColor = DEFAULT_COLOR;
    [self.view addSubview:resultBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//アラーム決定
- (void) result {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *result = [formatter stringFromDate:datePicker.date];

    NSMutableDictionary *alarmDic = [NSMutableDictionary dictionary];
    [alarmDic setObject:result forKey:@"ALARM"];
    [alarmDic setObject:@"1" forKey:@"RUN_FLAG"];
    [alarmDic setObject:@"1" forKey:@"REPEAT_FLAG"];
    BOOL ret = [_helper insert:alarmDic];
    
    //INSERT成功したら
    if(ret) {
        [self.navigationController popViewControllerAnimated:YES];

    //INSERT失敗したら
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"確認" message:@"すでに登録されています" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"はい" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }]];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
