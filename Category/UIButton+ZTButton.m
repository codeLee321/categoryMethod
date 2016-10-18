//
//  UIButton+ZTButton.m
//  ZTLife
//
//  Created by Leo on 15/12/15.
//  Copyright © 2015年 ZThink. All rights reserved.
//

#import "UIButton+ZTButton.h"

@implementation UIButton (ZTButton)

+ (UIButton *)buttonTitle:(NSString *)title setBackground:(UIColor *)backColor andImage:(NSString *)imageName titleColor:(UIColor *)titltColor titleFont:(CGFloat)titleFont {
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = backColor;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitleColor:titltColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    
    return button;
}


+ (UIButton *)buttonTitle:(NSString *)title setBackground:(UIColor *)backColor andImage:(NSString *)imageName titleColor:(UIColor *)titltColor titleFont:(CGFloat)titleFont andCordius:(CGFloat)cordius andMask:(BOOL)mask {
    
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = backColor;
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitleColor:titltColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    button.layer.cornerRadius = cordius;
    button.layer.masksToBounds = mask;
    
    return button;
}

@end
