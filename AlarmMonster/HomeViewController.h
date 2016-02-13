//
//  HomeViewController.h
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/30.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "FoundationViewController.h"
#import "OrgButton.h"
#import "AlarmDBHelper.h"
#import "AlarmModel.h"

@interface HomeViewController : FoundationViewController {
    AlarmDBHelper *helper;
    AlarmModel *model;
}
@end
