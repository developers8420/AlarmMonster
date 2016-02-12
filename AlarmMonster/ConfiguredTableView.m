//
//  ConfiguredTableView.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/30.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "ConfiguredTableView.h"

@implementation ConfiguredTableView

- (id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.separatorInset = UIEdgeInsetsZero;
        _model = [[UserDefaultModel alloc] init];
        _helper = [[AlarmDBHelper alloc] init];
        if ([self respondsToSelector:@selector(layoutMargins)]) {
            self.layoutMargins = UIEdgeInsetsZero;
        }
    }
    
    return self;
}

-(NSInteger)numberOfSectionsInTableView: (UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_model getAlarmSettingAry] count];
}

-(UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    CGRect cellRect = CGRectMake(0, 0, self.frame.size.width, 40);
    UIView *cellView = [[UIView alloc] initWithFrame:cellRect];
    
    
    NSString *alarm = [_model getAlarm:indexPath.row];
    CGRect alarmRect = CGRectMake(5, 5, 100, 30);
    UILabel *alarmLabel = [LabelFactory planeLabel:alarmRect
                                              text:alarm
                                              font:[UIFont boldSystemFontOfSize:20]
                                         textColor:[UIColor lightGrayColor]
                                     textAlignment:NSTextAlignmentCenter
                                   backgroundColor:[UIColor clearColor]];
    
    
    BOOL flag = ([[_model getFlag:indexPath.row] isEqualToString:@"1"]) ? YES : NO;
    CGRect flagRect = CGRectMake(self.frame.size.width-55, 5, 40, 30);
    UISwitch *flagSwitch = [SwitchFactory planeSwitch:flagRect
                                                   on:flag
                                             delegate:self
                                               action:@selector(changeFlag:)
                                                  tag:indexPath.row];

    [cellView addSubview:alarmLabel];
    [cellView addSubview:flagSwitch];
    
    [cell.contentView addSubview:cellView];
    return cell;
}

- (void) changeFlag :(UISwitch*)sw {
    
}

@end
