//
//  SwitchFactory.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/02/07.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "SwitchFactory.h"

@implementation SwitchFactory

+ (UISwitch *) planeSwitch:(CGRect)rect
                        on:(BOOL)on
                  delegate:(id)delegate
                    action:(SEL)action
                       tag:(NSInteger)tag {
    
    UISwitch *sw = [SwitchFactory switch:rect
                    on:on
                    delegate:delegate
                    action:action
                    tag:tag];
    
    return sw;
    
}

+ (UISwitch *) switch:(CGRect)rect
                        on : (BOOL) on
                   delegate:(id)delegate
                     action:(SEL)action
                       tag :(NSInteger) tag {
    
    UISwitch *sw = [[UISwitch alloc] initWithFrame:rect];
    sw.on = on;
    [sw addTarget:delegate action:action forControlEvents:UIControlEventValueChanged];
    sw.tag = tag;
    
    return sw;
}
@end
