//
//  AppDelegate+ZTJPush.m
//  ZTLife
//
//  Created by tony on 16/1/5.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "AppDelegate+ZTJPush.h"
#import "APService.h"
#import "ZTWinTipsModel.h"
#import "ZTGoodsDetailTVC.h"
#import "ZTTabBarController.h"
#import "ZTShareTipsView.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"

@implementation AppDelegate (ZTJPush)

- (void)initJPushWithApplication:(UIApplication *)application withOptions:(NSDictionary *)launchOptions
{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    
    [defaultCenter addObserver:self
                      selector:@selector(networkDidSetup:)
                          name:kJPFNetworkDidSetupNotification
                        object:nil];
    
    [defaultCenter addObserver:self
                      selector:@selector(networkDidClose:)
                          name:kJPFNetworkDidCloseNotification
                        object:nil];
    
    [defaultCenter addObserver:self
                      selector:@selector(networkDidRegister:)
                          name:kJPFNetworkDidRegisterNotification
                        object:nil];
    
    [defaultCenter addObserver:self
                      selector:@selector(networkDidLogin:)
                          name:kJPFNetworkDidLoginNotification
                        object:nil];

    [defaultCenter addObserver:self
                      selector:@selector(networkDidReceiveMessage:)
                          name:kJPFNetworkDidReceiveMessageNotification
                        object:nil];
    
    [defaultCenter addObserver:self
                      selector:@selector(networkDidReceiveMessage:)
                          name:kJPFServiceErrorNotification
                        object:nil];
    
    
    // app关闭状态下，点击推送进来，通过下面的方法才能触发didReceiveRemoteNotification
    NSDictionary *apsDict = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (apsDict) {
        [self application:application didReceiveRemoteNotification:apsDict fetchCompletionHandler:^(UIBackgroundFetchResult result) {
            //
        }];
        
        [self goToMssageViewControllerWith:apsDict];
    }

    
    // Required    极光推送
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //categories
        [APService
         registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                             UIUserNotificationTypeSound |
                                             UIUserNotificationTypeAlert)
         categories:nil];
    } else {
        //categories nil
        [APService
         registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                             UIRemoteNotificationTypeSound |
                                             UIRemoteNotificationTypeAlert)
#else
         //categories nil
         categories:nil];
        [APService
         registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                             UIRemoteNotificationTypeSound |
                                             UIRemoteNotificationTypeAlert)
#endif
         // Required
         categories:nil];
    }
    [APService setupWithOption:launchOptions];
}

#pragma mark - 处理极光推送

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // Required
    [APService registerDeviceToken:deviceToken];
    
    // 要注意，设置alias；不然收不到推送的
//    [APService setTags:nil alias:[NSString stringWithFormat:@"%@", kGetUserId] callbackSelector:nil target:self];
    
    // 用于极光单推的方式1 registrationID：[APService registrationID]
    // [APService setAlias:[APService registrationID] callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:self];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"DeviceToken 获取失败，原因：%@",error);
}

//- (void)tagsAliasCallback:(int)iResCode tags:(NSSet*)tags alias:(NSString*)alias
//{
//    NSLog(@"rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, tags , alias);
//    
//    // 用于极光单推的方式2 别名： alias
//    [[NSUserDefaults standardUserDefaults] setObject:kGetUserId forKey:@"alias"];
//}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"推送消息-------%@",userInfo);
    
    // Required
    [APService handleRemoteNotification:userInfo];
    
    application.applicationIconBadgeNumber = 0;
    [self goToMssageViewControllerWith:userInfo];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [application setApplicationIconBadgeNumber:0];   // 清除角标
    [application cancelAllLocalNotifications];
}

#pragma mark - 收到消息
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    // 取得 APNs 标准信息内容，如果没需要可以不取
    NSDictionary *aps = [userInfo valueForKey:@"aps"];
    NSString *content = [aps valueForKey:@"alert"];                 // 推送显示的内容
    NSInteger badge = [[aps valueForKey:@"badge"] integerValue];
    NSString *sound = [aps valueForKey:@"sound"];                   // 播放的声音
    NSLog(@"收到通知:%@ ---content:::%@---badge:::%ld---sound:::%@",userInfo, content, badge, sound);
    
    
    // IOS 7 Support Required
    // 取得自定义字段内容，userInfo就是后台返回的JSON数据，是一个字典
    [APService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);

    /**
     *    UIApplicationStateActive,
     *    UIApplicationStateInactive,
     *    UIApplicationStateBackground
     */
    UIApplicationState applicationState = [UIApplication sharedApplication].applicationState;
    
    
    // 根据userInfo里的参数，执行相关跳转逻辑
    // 只有程序处于 不活跃 状态才跳转到指定页面
    if(applicationState != UIApplicationStateActive)
    {
        // 跳转
        // [self push];
        [self goToMssageViewControllerWith:userInfo];
        
        // 提醒数字设为 0
        application.applicationIconBadgeNumber = 0;
    }
}

- (void)application:(UIApplication*)application didReceiveLocalNotification:(UILocalNotification*)notification
{
    [APService showLocalNotificationAtFront:notification identifierKey:nil];
}

// 极光的回调查看问题所在
- (void)networkDidSetup:(NSNotification*)notification
{
    NSLog(@"已连接");
}

- (void)networkDidClose:(NSNotification*)notification
{
    NSLog(@"未连接");
}

- (void)networkDidRegister:(NSNotification*)notification
{
    NSLog(@"%@", [notification userInfo]);
    
    NSLog(@"已注册");
}

- (void)networkDidLogin:(NSNotification*)notification
{
    NSLog(@"已登录");
    
    if([APService registrationID])
    {
        NSLog(@"get RegistrationID------%@", [APService registrationID]);
    }
}

// 通知方法（这个先留下）
- (void)networkDidLoginMessage:(NSNotification *)notification
{
    // 注销通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kJPFNetworkDidLoginNotification object:nil];
}

#pragma mark - 接收到自定义消息
- (void)networkDidReceiveMessage:(NSNotification *)notification
{
    NSDictionary * userInfo = [notification userInfo];
    
    ZTWinTipsModel *winTipsModel = [ZTWinTipsModel yy_modelWithDictionary:userInfo];
    ZTWinTips *winTips =  winTipsModel.extras;

    if (winTips) {
        
        if ([winTips.message_type isEqualToString:@"winng"]) {
            // 跳转
            [self pushGoodsDetailTVC:winTips];
        }
        
        if ([winTips.message_type isEqualToString:@"share"])
        {
            // 处理分享消息 拿微信朋友圈分享返回值 调接口（8.2. 分享抽夺宝红包（需要权限）） 换了显示价格  跳首页

            ZTShareTipsView *cover = [ZTShareTipsView showShareTipsView];
            cover.shareBlock = ^() {
                
                [ZTTmpDataStorage shareInstance].thirdPartyType = CricleShareGetRedPacket;
                
                [[ZTThirdPartyLogin thirdPartyLogin] shareToFriendCircle:[winTips yy_modelToJSONObject]];
            };
        }
    }
}

#pragma mark - 需要跳转的界面
- (void)pushGoodsDetailTVC:(ZTWinTips *)winTips
{
    // 获取导航控制器
    ZTTabBarController *tabVC = (ZTTabBarController *)self.window.rootViewController;
    UINavigationController *pushClassStance = (UINavigationController *)tabVC.viewControllers[tabVC.selectedIndex];
    
    // 跳转到商品详情
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"GetTreasureSB" bundle:nil];
    ZTGoodsDetailTVC *goodsDetailtVC = [storyboard instantiateViewControllerWithIdentifier:@"ZTGoodsDetailTVC"];
    goodsDetailtVC.winTips = winTips;
    
    [pushClassStance pushViewController:goodsDetailtVC animated:YES];
}

- (void)goToMssageViewControllerWith:(NSDictionary*)msgDic
{
    NSLog(@"推送通知：：%@", msgDic);
    
    // 将字段存入本地，在跳转的页面用它来判断
    [[ZTOperation shareInstance] defaultObjectSetWithKey:@"push" object:@"push"];
    
    // 留着以后作跳转用
    NSString * targetStr = [msgDic objectForKey:@"target"];
    if ([targetStr isEqualToString:@"notice"]) {
//        ZTTabBarController *tabBarVC = [[ZTTabBarController alloc] init];
//        ZTkeyWindow.rootViewController = tabBarVC;
    }
}

- (void)dealloc
{
    [self unObserveAllNotifications];
}

- (void)unObserveAllNotifications
{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidSetupNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidCloseNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidRegisterNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidLoginNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidReceiveMessageNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFServiceErrorNotification
                           object:nil];
}

@end
