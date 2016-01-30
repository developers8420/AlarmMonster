//
//  FoundationViewController.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/30.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "FoundationViewController.h"

@interface FoundationViewController ()

@end

@implementation FoundationViewController

#define MARGIN 10

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //画面サイズ(ステータスバー込み)
    _screenSize =  [[UIScreen mainScreen] bounds].size;
    
    //ステータスバーの高さ取得
    _statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    //ナビゲーションバーの高さの取得
    _navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    
    _defaultX      = MARGIN;
    _defaultY      = _statusHeight + _navigationBarHeight + MARGIN;
    _defaultWidth  = _screenSize.width - (MARGIN * 2);
    _defaultHeight = _screenSize.height - _defaultY - MARGIN;
    _defaultRect   = CGRectMake(_defaultX, _defaultY, _defaultWidth, _defaultHeight);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
