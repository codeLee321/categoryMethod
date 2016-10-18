//
//  NSString+VerifyPhoneNumber.h
//  ZTLife
//
//  Created by Leo on 15/12/8.
//  Copyright © 2015年 ZThink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VerifyPhoneNumber)

#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;

#pragma 正则匹配用户密码(由数字/大写字母/小写字母/标点符号组成，四种都可，6-18位)
+ (BOOL)checkPassword:(NSString *) password;

#pragma 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName;

#pragma 正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString *) idCard;

#pragma 正则匹员工号,12位的数字
+ (BOOL)checkEmployeeNumber : (NSString *) number;

#pragma 正则匹配URL
+ (BOOL)checkURL : (NSString *) url;

#pragma 昵称
+ (BOOL) validateNickname:(NSString *)nickname;

//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;

//密码
+ (BOOL) validatePassword:(NSString *)passWord;

//获取时间戳*随机数作为 uid
+(NSString *)timeStamp;

/**
 *  是否是三方登录
 *
 *  YES  头像不要拼接路径
 *  NO   头像要拼接路径
 */
+ (BOOL)isThirdPartyLogin:(NSString *)imageUrl;

@end
