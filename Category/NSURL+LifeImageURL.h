//
//  NSURL+LifeImageURL.h
//
//  Created by tony on 15/9/18.
//

#import <UIKit/UIKit.h>

@interface NSURL (LifeImageURL)

+ (NSURL *)urlWithString:(NSString *)urlPath AndImageSize:(CGSize)size;

@end
