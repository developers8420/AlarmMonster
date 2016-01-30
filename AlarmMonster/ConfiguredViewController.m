//
//  ConfiguredViewController.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/30.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "ConfiguredViewController.h"

@interface ConfiguredViewController ()

@end

@implementation ConfiguredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ConfiguredTableView *tableView = [[ConfiguredTableView alloc] initWithFrame:self.defaultRect style:UITableViewStylePlain];
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
