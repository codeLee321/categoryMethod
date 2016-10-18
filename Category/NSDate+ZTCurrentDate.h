//
//  NSDate+ZTCurrentDate.h
//  ZTLife
//
//  Created by Leo on 15/12/12.
//  Copyright © 2015年 ZThink. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NeedDateType) {
    NeedDateTypeMinute             = 1,        /**< 精确到分钟 */
    NeedDateTypeSecond             = 2,        /**< 精确到秒 */
    NeedDateTypeMilliSecond        = 3,        /**< 精确到毫秒 */
    NeedDateTypeChinaDateFormat    = 4         /**< 中文日期格式，年月日 */
};

@interface NSDate (ZTCurrentDate)

/** 获取当前时间 */
+ (NSString *)getCurrentDate;

/** date 转字符串 */
+ (NSString *)stringFromDate:(NSDate *)date;

/** 字符串转date */
+ (NSDate *)convertDateFromString:(NSString*)dateStr;

/** date转年月日 */
+ (NSString *)yearsDate:(NSDate *)timesDate;

/** 将系后台日期字符串转为需求日期的字符串 */
+ (NSString *)stringFromDateStr:(NSString*)dateStr;
+ (NSString *)stringFromDateStr:(NSString*)dateStr dateType:(NeedDateType)dateType;

@end
