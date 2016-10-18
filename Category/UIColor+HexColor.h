//
//  UIColor+HexColor.h
//
//  Created by tony on 15/9/18.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)
/**
 *  十六进制设置颜色
 *
 */
+ (UIColor *)colorWithHex:(NSString *)hex;

@end
