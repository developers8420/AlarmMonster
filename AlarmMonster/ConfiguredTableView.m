//
//  ConfiguredTableView.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/30.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "ConfiguredTableView.h"

@implementation ConfiguredTableView
#define HIDDEN_COLOR [UIColor colorWithRed:0.808 green:0.859 blue:0.851 alpha:0.5];

- (id) initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.separatorInset = UIEdgeInsetsZero;
        _helper = [[AlarmDBHelper alloc] init];
        _model = [[AlarmModel alloc] init];
        [_model setAlarmArray:[_helper selectAll]];
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
    return [[_model getAlarmArray] count];
}

-(UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    for (UIView *subview in [cell.contentView subviews]) {
        [subview removeFromSuperview];
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
    
    BOOL flag = ([[_model getRunFlag:indexPath.row] isEqualToString:@"1"]) ? YES : NO;
    CGRect flagRect = CGRectMake(self.frame.size.width-55, 5, 40, 30);
    UISwitch *flagSwitch = [SwitchFactory planeSwitch:flagRect
                                                   on:flag
                                             delegate:self
                                               action:@selector(changeRunFlag:)
                                                  tag:indexPath.row];
    cell.backgroundColor = (flag) ? [UIColor whiteColor] : HIDDEN_COLOR;

    [cellView addSubview:alarmLabel];
    [cellView addSubview:flagSwitch];
    
    [cell.contentView addSubview:cellView];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @[[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
                                                title:@"削除"
                                              handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                                  [_helper delete:[_model getAlarmDic:indexPath.row]];
                                                  [self reloadModelView];
                                              }]];
}

- (void) changeRunFlag :(UISwitch*)sw {
    NSString *flag = (sw.on) ? @"1" : @"0";
    NSMutableDictionary *takeDic = [_model getAlarmDic:sw.tag];
    [takeDic setObject:flag forKey:@"RUN_FLAG"];
    
    [_helper update:takeDic];
    [_model setAlarmNotification];
    [self reloadModelView];
}

- (void) reloadModelView {
    [_model setAlarmArray:[_helper selectAll]];
    [self reloadData];
}

@end
