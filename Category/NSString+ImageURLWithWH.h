//
//  NSString+ImageURLWithWH.h
//
//  Created by tony on 15/9/18.
//

#import <Foundation/Foundation.h>

@interface NSString (ImageURLWithWH)
/**
 *  替换URL中图片的尺寸
 */
- (NSString *)replaceWHWithWidth:(NSInteger)width AndHeight:(NSInteger)height;


/**
 *  把服务端返回的@"yyyyMMddHHmmssSSS"转成@"yyyy-MM-dd HH:mm"
 *
 *  不要后面的@“ssSS”
 */
+ (NSString *)otherTypeTimes:(NSString *)string;


/**
 *  把服务端返回的@"yyyyMMddHHmmssSSS"转成@"yyyy-MM-dd HH:mm"
 *
 *  要后面的@“ssSS”
 */
+ (NSString *)otherTypeTimesHavessSS:(NSString *)string;


/**
 *  把服务端返回的@"yyyyMMddHHmmssSSS"转成@"yyyy年MM月dd"
 *
 *  不要后面的@“HH:mm ssSS”
 */
+ (NSString *)otherTypeTimesYears:(NSString *)string;

/**
 *  把服务端返回的浮点数保留3位小数
 *
 *  如果是0则控制为0.0
 */
+ (NSString *)manageDoubleWithString:(NSString *)string;

@end
