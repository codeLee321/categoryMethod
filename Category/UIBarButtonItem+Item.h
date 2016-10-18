//
//  UIBarButtonItem+Item.h
//
//  Created by tony on 14-12-7.
//  Copyright (c) 2014年 tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)


+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage title:(nullable NSString *)title target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
