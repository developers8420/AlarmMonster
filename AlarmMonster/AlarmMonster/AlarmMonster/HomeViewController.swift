//
//  HomeViewController.swift
//  AlarmMonster
//
//  Created by 秋山友也 on 2015/11/29.
//  Copyright © 2015年 Shun Uehara. All rights reserved.
//

import UIKit

class HomeViewController: FoundationViewController {

    //枠線
    @IBOutlet weak var borderMainView: UIView!
    @IBOutlet weak var borderSubView: UIView!
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiInitialize()
    }
    
    //UIパーツの初期化
    func uiInitialize() {
        
        //枠線メイン
        borderMainView.layer.borderColor = UIColor.blackColor().CGColor
        borderMainView.layer.borderWidth = 1
        
        //枠線サブ
        borderSubView.layer.borderColor = UIColor.blackColor().CGColor
        borderSubView.layer.borderWidth = 1
        
        //キャラクター表示(仮)
        characterImageView.image = UIImage(named: "わたあめ.png")
        characterImageView.backgroundColor = UIColor.lightGrayColor()
        
        //タイマー
        // タッチしたら・・・
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
