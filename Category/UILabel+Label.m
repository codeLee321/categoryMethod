//
//  UILabel+Label.m
//  ZTLife
//
//  Created by Leo on 15/12/3.
//  Copyright © 2015年 ZThink. All rights reserved.
//

#import "UILabel+Label.h"

@implementation UILabel (Label)

+ (UILabel *)labelText:(NSString *)content andFont:(CGFloat)font andColor:(UIColor *)textColor {
    
    UILabel *label = [[UILabel alloc]init];
    label.text = content;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:font];
    
    return label;
}


@end
