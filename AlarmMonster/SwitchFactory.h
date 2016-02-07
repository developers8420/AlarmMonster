//
//  SwitchFactory.h
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/02/07.
//  Copyright © 2016年 developers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchFactory : UISwitch
+ (UISwitch *) planeSwitch:(CGRect)rect
                        on : (BOOL) on
                   delegate:(id)delegate
                     action:(SEL)action
                       tag :(NSInteger) tag;
@end
