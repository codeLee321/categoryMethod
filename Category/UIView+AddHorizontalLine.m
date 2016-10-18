//
//  UIView+AddHorizontalLine.m
//
//  Created by tony on 15/9/18.
//

#import "UIView+AddHorizontalLine.h"

@implementation UIView (AddHorizontalLine)

- (void)addHorizontalLineWithColor:(UIColor *)lineColor
{
    CAShapeLayer *line = [CAShapeLayer layer];
    UIBezierPath *linePath=[UIBezierPath bezierPath];
    [linePath moveToPoint: CGPointMake(CGRectGetMinX(self.bounds), CGRectGetMidY(self.bounds))];
    [linePath addLineToPoint:CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMidY(self.bounds))];
    line.path=linePath.CGPath;
    line.fillColor = nil;
    line.opacity = 1.0;
    line.strokeColor = lineColor.CGColor;
    [self.layer addSublayer:line];
    
}

@end
