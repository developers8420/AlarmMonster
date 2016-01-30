//
//  OrgButton.h
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/01/30.
//  Copyright © 2016年 developers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrgButton : UIButton

+ (UIButton *)planeButton:(CGRect)frame text:(NSString *)text delegate:(id)delegate action:(SEL)action tag:(NSInteger)tag;
+ (UIButton *)imageButton:(CGRect)frame img:(UIImage *)img isHighlighte:(BOOL)isHighlighte on_img:(UIImage *)on_img delegate:(id)delegate action:(SEL)action tag:(NSInteger)tag;

@end
