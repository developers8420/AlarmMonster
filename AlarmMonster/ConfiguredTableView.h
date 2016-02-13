//
//  ConfiguredTableView.h
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/30.
//  Copyright © 2016年 developers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmModel.h"
#import "LabelFactory.h"
#import "SwitchFactory.h"
#import "AlarmDBHelper.h"

@interface ConfiguredTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property AlarmModel *model;
@property AlarmDBHelper *helper;
@end
