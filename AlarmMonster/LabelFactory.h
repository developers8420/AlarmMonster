//
//  LabelFactory.h
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/02/07.
//  Copyright © 2016年 developers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LabelFactory : UILabel

+ (UILabel *)planeLabel:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment backgroundColor:(UIColor *)backgroundColor;
+ (UILabel *)roundRectLabel:(CGRect)rect text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment backgroundColor:(UIColor *)backgroundColor cornerRadious:(CGFloat)cornerRadius;

@end
