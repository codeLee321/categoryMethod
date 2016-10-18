//
//  NSString+ImageURLWithWH.m
//
//  Created by tony on 15/9/18.
//

#import "NSString+ImageURLWithWH.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation NSString (ImageURLWithWH)


- (NSString *)replaceWHWithWidth:(NSInteger)width AndHeight:(NSInteger)height
{
    NSString *widthWithHeight = [NSString stringWithFormat:@"%ld.%ld",(long)width,(long)height];
    NSRange whRange = [self rangeOfString:@"w.h"];
    if (whRange.location != NSNotFound) {
        NSString *replacedString = [self stringByReplacingCharactersInRange:whRange withString:widthWithHeight];
        return replacedString;
    }
    return nil;
}


+ (NSString *)otherTypeTimes:(NSString *)string {
    
    // 12位 到 分  14位 到  秒
    NSString *afterStr = [string substringToIndex:12];
    NSMutableString *mutableString = [[NSMutableString alloc] initWithFormat:@"%@",afterStr];
    
    [mutableString insertString:@"-" atIndex:4];
    [mutableString insertString:@"-" atIndex:7];
    [mutableString insertString:@" " atIndex:10];
    [mutableString insertString:@":" atIndex:13];
    [mutableString insertString:@" " atIndex:16];

    return mutableString;
}


+ (NSString *)otherTypeTimesHavessSS:(NSString *)string {
    
    // 12位 到 分  14位 到  秒
    NSMutableString *mutableString = [[NSMutableString alloc] initWithFormat:@"%@",string];
    
    [mutableString insertString:@"-" atIndex:4];
    [mutableString insertString:@"-" atIndex:7];
    [mutableString insertString:@" " atIndex:10];
    [mutableString insertString:@":" atIndex:13];
    [mutableString insertString:@":" atIndex:16];
    [mutableString insertString:@"." atIndex:19];
    
    return mutableString;
}

+ (NSString *)otherTypeTimesYears:(NSString *)string {
    
     NSString *afterStr = [string substringToIndex:8];
    NSMutableString *mutableString = [[NSMutableString alloc] initWithFormat:@"%@",afterStr];
    [mutableString insertString:@"年" atIndex:4];
    [mutableString insertString:@"月" atIndex:7];
    [mutableString insertString:@"日" atIndex:10];
    
    return mutableString;

}

+ (NSString *)manageDoubleWithString:(NSString *)string {
    
    if ([string isEqualToString:@"0"])
        
        return  @"0.0";
        
    return [NSString stringWithFormat:@"%.3f",(double)[string doubleValue]];
}

@end
