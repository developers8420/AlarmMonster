//
//  GraveListCollectionViewCell.swift
//  AlarmMonster
//
//  Created by 秋山友也 on 2015/11/07.
//  Copyright (c) 2015年 Shun Uehara. All rights reserved.
//

import UIKit

class GraveListCollectionViewCell: UICollectionViewCell {
    private var graveImageView: UIImageView!
    
    required init?(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)
    }
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        graveImageView = UIImageView(frame: CGRectMake(0,0,frame.width, frame.height))
        graveImageView.image = UIImage(named: "にわとりさん.png")
        self.backgroundColor = UIColor.whiteColor()
        self.contentView.addSubview(graveImageView)
        
        //UILabelを生成
        /*
        textLabel = UILabel(frame: CGRectMake(0, 0, frame.width, frame.height))
        textLabel?.text = "nil"
        textLabel?.backgroundColor = UIColor.whiteColor()
        textLabel?.textAlignment = NSTextAlignment.Center
        */
        //Cellに追加
        //self.contentView.addSubview(textLabel!)
    }
}
