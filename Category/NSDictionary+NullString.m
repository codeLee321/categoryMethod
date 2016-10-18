//
//  NSDictionary+NullString.m
//  ZTLife
//
//  Created by raven on 16/4/12.
//  Copyright © 2016年 ZThink. All rights reserved.
//

#import "NSDictionary+NullString.h"

@implementation NSDictionary (NullString)


- (NSDictionary *)dataWithoutNullData
{
    NSMutableDictionary *dicReturn = [NSMutableDictionary new];
    
    NSArray *keys;
    int i, count;
    id key, value,tmpValue;
    
    keys = [self allKeys];
    count = (int)[keys count];

    for (i = 0; i < count; i++)
    {
        key = [keys objectAtIndex: i];
        
        tmpValue = [self objectForKey: key];
        
        if([tmpValue isKindOfClass:[NSArray class]] || [tmpValue isKindOfClass:[NSMutableArray class]])
        {
            // 数组情况 - 遍历数组处理每个字典
            value = [self dataContentArray:tmpValue];
        }else
        {
            value = [self ridNullString:[self objectForKey: key]];
        }
        
        [dicReturn setValue:value forKey:key];
    }

    
    return dicReturn;
}

// 字典取出的value 是单独一个值(字符串、CFNumber等)
- (NSDictionary *)dataNormalDictionary
{
    NSMutableDictionary *dicReturn = [NSMutableDictionary new];
    
    NSArray *keys;
    int i, count;
    id key, value;
    
    keys = [self allKeys];
    count = (int)[keys count];
    
    for (i = 0; i < count; i++)
    {
        key = [keys objectAtIndex: i];
        value = [self ridNullString:[self objectForKey: key]];
        
        [dicReturn setValue:value forKey:key];
    }
    
    return dicReturn;
}

// 传参字典，字典取出的value 是单独一个值(字符串、CFNumber等)
- (NSDictionary *)dataNormalDictionary:(NSDictionary *)dicData
{
    NSMutableDictionary *dicReturn = [NSMutableDictionary new];
    
    NSArray *keys;
    int i, count;
    id key, value;
    
    keys = [dicData allKeys];
    count = (int)[keys count];
    
    for (i = 0; i < count; i++)
    {
        key = [keys objectAtIndex: i];
        value = [self ridNullString:[dicData objectForKey: key]];
        
        [dicReturn setValue:value forKey:key];
    }
    
    return dicReturn;
}

// 遍历数组处理每一个字典
- (NSMutableArray *)dataContentArray:(id)arrayData{
    
    // 容错处理
    if(arrayData == nil || arrayData == [NSNull null])
        return arrayData;
    
    NSArray *array = (NSArray *)arrayData;
    
    if([array count] < 1)
        return arrayData;
    
    NSMutableArray *arrayReturn = [NSMutableArray new];
    
    for(int i=0 ;i <[array count] ; i++)
    {
        // 每一个item 都是一个字典,处理每一个字典，加入返回数组
        [arrayReturn addObject:[self dataNormalDictionary:array[i]]];
    }
    
    return arrayReturn;
}

// 如果是nil 的字符串，转换为@""空字符串
- (id)ridNullString:(id)data
{
    if(data == nil || data == [NSNull null])
        return @"";
    
    if([data isKindOfClass:[NSString class]])
    {
        if (((NSString *)data).length < 1)
            return @"";
    }
    
    return data;
}



@end
