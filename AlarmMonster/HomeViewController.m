//
//  HomeViewController.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/30.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController {
    UIButton *alarmDispBtn;
}

#define ALARM_IMG @"めざまし時計アイコン.png"
#define MONSTER_IMG @"設定アイコン.png"
#define WATAAME_IMG @"おにぎりさん.png"

- (void)viewDidLoad {
    [super viewDidLoad];

    helper = [[AlarmDBHelper alloc] init];
    model = [[AlarmModel alloc] init];
    [model setAlarmArray:[helper selectAll]];
    self.view.backgroundColor = BACK_COLOR;

    //イメージを乗せるビュー
    CGRect viewRect = CGRectMake(self.defaultX, self.defaultY, self.defaultWidth, self.defaultHeight - 70);
    UIView *backView = [[UIView alloc] initWithFrame:viewRect];
    backView.backgroundColor = DEFAULT_COLOR;
    [self.view addSubview:backView];

    //モンスターイメージ
    CGRect monsterImgRect = CGRectMake(viewRect.size.width/3, viewRect.size.height/3, viewRect.size.width/3, viewRect.size.height/3);
    UIImage *monsterImg = [UIImage imageNamed:WATAAME_IMG];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:monsterImgRect];
    imgView.image = monsterImg;
    [backView addSubview:imgView];

    //時間表示
    CGRect alarmLabelRect = CGRectMake(self.defaultX, self.defaultY + viewRect.size.height + 10, self.defaultWidth , 60);
    alarmDispBtn = [OrgButton planeButton:alarmLabelRect text:[model getFirstAlarm] delegate:self action:@selector(moveConfigured) tag:3];
    alarmDispBtn.backgroundColor = DEFAULT_COLOR;
    [self.view addSubview:alarmDispBtn];

    //イメージサイズ
    CGRect imgRect = CGRectMake(0, 0, 30,30);

    //イメージの設定
    UIImage *alarmSettingImg = [UIImage imageNamed:ALARM_IMG];
    UIImage *monsterSettingImg = [UIImage imageNamed:MONSTER_IMG];

    //ボタンの作成
    UIButton *alarmBtn = [OrgButton imageButton:imgRect
                                            img:alarmSettingImg
                                            isHighlighte:YES
                                            on_img:alarmSettingImg
                                            delegate:self
                                            action:@selector(moveAlarmSetting)
                                            tag:1];

    UIButton *monsterBtn = [OrgButton imageButton:imgRect
                                              img:monsterSettingImg
                                     isHighlighte:YES
                                           on_img:monsterSettingImg
                                         delegate:self
                                           action:@selector(moveMonsterSetting)
                                              tag:2];

    //バーボタンの作成
    UIBarButtonItem *alarmBarBtn = [[UIBarButtonItem alloc] initWithCustomView:alarmBtn];
    UIBarButtonItem *monsterBarBtn = [[UIBarButtonItem alloc] initWithCustomView:monsterBtn];

    //バーボタンの設定
    self.navigationItem.rightBarButtonItem = alarmBarBtn;
    //self.navigationItem.leftBarButtonItem = monsterBarBtn;
}

- (void) viewWillAppear:(BOOL)animated {
    [model setAlarmArray:[helper selectAll]];
    [alarmDispBtn setTitle:[model getFirstAlarm] forState:UIControlStateNormal];
}

//アラーム設定画面に遷移
- (void) moveAlarmSetting {
    NSLog(@"アラーム設定に移動！");
     [self performSegueWithIdentifier:@"AlarmSettingSegue" sender:self];
}

//モンスター設定画面に遷移
- (void) moveMonsterSetting {
    NSLog(@"モンスター設定に移動！");
    [self performSegueWithIdentifier:@"MonsterSettingSegue" sender:self];
}

//設定済みのアラーム画面に遷移
- (void) moveConfigured {
    [self performSegueWithIdentifier:@"ConfiguredSegue" sender:self];
}

//遷移先にパラメータを渡す場合
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"AlarmSettingSegue"]) {
            
    } else if ([[segue identifier] isEqualToString:@"MonsterSettingSegue"]){

    } else if ([[segue identifier] isEqualToString:@"ConfiguredSegue"]){

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
