//
//  FoundationViewController.h
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/30.
//  Copyright © 2016年 developers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoundationViewController : UIViewController

@property CGSize  screenSize;           //画面サイズ(ステータスバー込み)
@property float statusHeight;           //ステータスバー
@property float navigationBarHeight;    //ナビゲーションバー

@property float defaultX;               //下地のビューx開始地点
@property float defaultY;               //下地のビューy開始地点
@property float defaultWidth;           //下地のビュー横幅
@property float defaultHeight;          //下地のビュー縦幅
@property CGRect defaultRect;           //下地の配置


@end
