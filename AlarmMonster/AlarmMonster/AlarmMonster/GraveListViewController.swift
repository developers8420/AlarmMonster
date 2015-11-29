    //
//  GraveListViewController.swift
//  AlarmMonster
//
//  Created by 秋山友也 on 2015/11/07.
//  Copyright (c) 2015年 Shun Uehara. All rights reserved.
//

import UIKit

    class GraveListViewController: FoundationViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
        var myCollectionView : UICollectionView!
        //結果表示用のimageView
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let layout = UICollectionViewFlowLayout()
            
            // Cell一つ一つの大きさ.
            layout.itemSize = CGSizeMake(screenSize.width/3-7,screenSize.width/3-7)
            
            // Cellのマージン.
            layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            
            // セクション毎のヘッダーサイズ.
            layout.headerReferenceSize = CGSizeMake(0,10)
            
            //CollectionViewのサイズ定義
            let x : CGFloat = 0
            let y : CGFloat = statusBarHeight!
            let width : CGFloat = screenSize.width
            let height : CGFloat = screenSize.height - statusBarHeight! - tabBarHeight!
            
            // CollectionViewを生成.
            myCollectionView = UICollectionView(frame: CGRectMake(x, y, width, height), collectionViewLayout: layout)
            
            // Cellに使われるクラスを登録.
            myCollectionView.registerClass(GraveListCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
            
            myCollectionView.delegate = self
            myCollectionView.dataSource = self
            
            self.view.addSubview(myCollectionView)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        /*
        Cellが選択された際に呼び出される
        */
        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
            print("Num: \(indexPath.row)")
            
        }
        
        /*
        Cellの総数を返す
        */
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 1
        }
        
        /*
        Cellに値を設定する
        */
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
            let cell : GraveListCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! GraveListCollectionViewCell
            //結果表示用のimageView
            
            //cell.textLabel?.text = indexPath.row.description
            
            return cell
        }
    }
