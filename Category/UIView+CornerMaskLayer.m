//
//  UIView+CornerMaskLayer.m
//
//  Created by tony on 15/9/18.
//

#import "UIView+CornerMaskLayer.h"

@implementation UIView (CornerMaskLayer)

- (void)addCornerMaskLayerWithRadius:(CGFloat)radius
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)].CGPath;
    self.layer.mask = layer;
}

@end
