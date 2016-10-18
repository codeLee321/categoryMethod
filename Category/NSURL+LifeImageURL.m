//
//  NSURL+LifeImageURL.m
//
//  Created by tony on 15/9/18.
//

#import "NSURL+LifeImageURL.h"
#import "NSString+ImageURLWithWH.h"

@implementation NSURL (LifeImageURL)

+ (NSURL *)urlWithString:(NSString *)urlPath AndImageSize:(CGSize)size
{
    NSURL *url = [NSURL URLWithString:[urlPath replaceWHWithWidth:size.width AndHeight:size.height]];
    return url;
}

@end
