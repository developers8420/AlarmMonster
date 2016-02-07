//
//  LabelFactory.m
//  AlarmMonster
//
//  Created by 秋山友也 on 2016/02/07.
//  Copyright © 2016年 developers. All rights reserved.
//

#import "LabelFactory.h"

@implementation LabelFactory

+ (UILabel *)planeLabel:(CGRect)rect
                   text:(NSString *)text
                   font:(UIFont *)font
              textColor:(UIColor *)textColor
          textAlignment:(NSTextAlignment)textAlignment
        backgroundColor:(UIColor *)backgroundColor
{
    UILabel *label = [LabelFactory label:rect
                                text:text
                                font:font
                           textColor:textColor
                       textAlignment:textAlignment
                     backgroundColor:backgroundColor];
    
    return (label);
}

+ (UILabel *)roundRectLabel:(CGRect)rect
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment
            backgroundColor:(UIColor *)backgroundColor
              cornerRadious:(CGFloat)cornerRadius
{
    UILabel *label = [LabelFactory label:rect
                                text:text
                                font:font
                           textColor:textColor
                       textAlignment:textAlignment
                     backgroundColor:backgroundColor];
    [[label layer] setCornerRadius:cornerRadius];
    [label setClipsToBounds:YES];
    return (label);
}

+ (UILabel *)label:(CGRect)rect
              text:(NSString *)text
              font:(UIFont *)font
         textColor:(UIColor *)textColor
     textAlignment:(NSTextAlignment)textAlignment
   backgroundColor:(UIColor *)backgroundColor
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.numberOfLines = 0;
    label.backgroundColor = backgroundColor;
    return (label);
}

@end
