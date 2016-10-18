//
//  NSData+Base64.h
//  ZTLife
//
//  Created by raven on 16/3/18.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)


- (NSString *)stringByBase64EncodingData;

- (NSString *)stringByBase64DecodingData;

@end
