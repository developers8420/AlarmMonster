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

@implementation HomeViewController

#define ALARM_IMG @"めざまし時計アイコン.png"
#define MONSTER_IMG @"設定アイコン.png"
#define WATAAME_IMG @"わたあめ1.png"

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //test code
//    UILabel *label = [[UILabel alloc] initWithFrame:self.defaultRect];
//    label.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:label];
    
    UIImage *wataameImg = [UIImage imageNamed:WATAAME_IMG];
    CGRect wataameImgRect = CGRectMake(self.defaultX, self.defaultY, self.defaultWidth, self.defaultHeight - 70);
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:wataameImgRect];
    imgView.image = wataameImg;
    imgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:imgView];
    
    CGRect alarmLabelRect = CGRectMake(self.defaultX, self.defaultY + wataameImgRect.size.height + 10, self.defaultWidth , 60);
    
    UIButton *alarmDispBtn = [OrgButton planeButton:alarmLabelRect text:@"06:30" delegate:self action:@selector(moveConfigured) tag:3];
    alarmDispBtn.layer.borderWidth = 1.0;
    alarmDispBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    /*
    UILabel *alarmLabel = [[UILabel alloc] initWithFrame:alarmLabelRect];
    alarmLabel.textAlignment = NSTextAlignmentCenter;
    alarmLabel.text = @"06:30";
    alarmLabel.layer.borderWidth = 1.0;
    alarmLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
     */
    [self.view addSubview:alarmDispBtn];
    
    //イメージサイズ
    CGRect imgRect = CGRectMake(0, 0, 30,30);
    
    //イメージの設定
    UIImage *alarmImg = [UIImage imageNamed:ALARM_IMG];
    UIImage *monsterImg = [UIImage imageNamed:MONSTER_IMG];
    
    //ボタンの作成
    UIButton *alarmBtn = [OrgButton imageButton:imgRect
                                            img:alarmImg
                                            isHighlighte:YES
                                            on_img:alarmImg
                                            delegate:self
                                            action:@selector(moveAlarmSetting)
                                            tag:1];
    
    UIButton *monsterBtn = [OrgButton imageButton:imgRect
                                              img:monsterImg
                                     isHighlighte:YES
                                           on_img:monsterImg
                                         delegate:self
                                           action:@selector(moveMonsterSetting)
                                              tag:2];
    
    //バーボタンの作成
    UIBarButtonItem *alarmBarBtn = [[UIBarButtonItem alloc] initWithCustomView:alarmBtn];
    UIBarButtonItem *monsterBarBtn = [[UIBarButtonItem alloc] initWithCustomView:monsterBtn];
    
    //バーボタンの設定
    self.navigationItem.rightBarButtonItem = alarmBarBtn;
    self.navigationItem.leftBarButtonItem = monsterBarBtn;
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
