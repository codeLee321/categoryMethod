//
//  UIImage+Image.h
//
//  Created by tony on 14-12-7.
//  Copyright (c) 2014年 tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

// 加载最原始的图片，没有渲染
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

+ (instancetype)imageWithStretchableName:(NSString *)imageName;

/**
 *  根据颜色生成一张尺寸为1*1的相同颜色图片
 *
 *  @param color   传入颜色
 *
 *  @return 根据颜色生成一张尺寸为1*1的相同颜色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
