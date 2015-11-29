//
//  FoundationViewController.swift
//  AlarmMonster
//
//  Created by 秋山友也 on 2015/10/24.
//  Copyright (c) 2015年 Shun Uehara. All rights reserved.
//

import UIKit

class FoundationViewController: UIViewController {

    //画面サイズ
    let screenSize: CGSize = UIScreen.mainScreen().bounds.size
    
    //ステータスバーの高さ
    var statusBarHeight:CGFloat?
    
    //ナビゲーションバーの高さ
    var navBarHeight :CGFloat?
    
    //タブバーの高さ
    var tabBarHeight :CGFloat?
    
    var tabBarY :CGFloat?
    
    //viewの初期高さ
    //var InitialHeight :CGFloat?
    
    //ステータスバーの高さを設定
    //let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //var ap:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //ステータスバーの高さを設定
        statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        //ナビゲーションバーの高さを設定
        //navBarHeight = self.navigationController!.navigationBar.frame.size.height
        
        //タブバーの高さを設定
        tabBarHeight = self.tabBarController!.tabBar.frame.size.height
        
        //タブバーの開始位置
        tabBarY = screenSize.height - tabBarHeight!;
        
        //screenSize.heightからstatusBarHeightを引いたもの
        //InitialHeight = screenSize.height-statusBarHeight!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
