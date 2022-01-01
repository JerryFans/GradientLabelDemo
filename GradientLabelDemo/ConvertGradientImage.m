//
//  ConvertGradientImage.m
//  GradientLabelDemo
//
//  Created by 逸风 on 2022/1/1.
//

#import "ConvertGradientImage.h"

@implementation ConvertGradientImage

+ (UIImage *_Nullable)gradientImageWithConfig:(GradientPatternLabelConfig *_Nonnull)config size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制渐变层
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef,
                                                           (__bridge CFArrayRef)@[(id)config.startColor.CGColor,(id)config.endColor.CGColor],
                                                           NULL);
    CGPoint startPoint = CGPointZero;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint,  kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    //取到渐变图片
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    //释放资源
    CGColorSpaceRelease(colorSpaceRef);
    CGGradientRelease(gradientRef);
    UIGraphicsEndImageContext();
    return gradientImage;
}

@end
