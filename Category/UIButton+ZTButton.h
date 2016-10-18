//
//  UIButton+ZTButton.h
//  ZTLife
//
//  Created by Leo on 15/12/15.
//  Copyright © 2015年 ZThink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZTButton)

// 没有圆角的
+ (UIButton *)buttonTitle:(NSString *)title setBackground:(UIColor *)backColor andImage:(NSString *)imageName titleColor:(UIColor *)titltColor titleFont:(CGFloat)titleFont;


// 有圆角

+ (UIButton *)buttonTitle:(NSString *)title setBackground:(UIColor *)backColor andImage:(NSString *)imageName titleColor:(UIColor *)titltColor titleFont:(CGFloat)titleFont andCordius:(CGFloat)cordius andMask:(BOOL)mask;

@end
