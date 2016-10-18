//
//  AppDelegate+ZTJPush.h
//  ZTLife
//
//  Created by tony on 16/1/5.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "AppDelegate.h"
@class ZTWinTips;

@interface AppDelegate (ZTJPush) <UIAlertViewDelegate>

/**
 *  初始化 极光推送
 *
 *  @param application   从launch传进来的参数
 *  @param launchOptions 从launch传进来的参数
 */
- (void)initJPushWithApplication:(UIApplication *)application
                     withOptions:(NSDictionary *)launchOptions;

/**
 *  跳转到哪个界面
 */
//- (void)push:(ZTWinTips *)winTips;

@end
