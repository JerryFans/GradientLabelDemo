//
//  ConvertGradientImage.h
//  GradientLabelDemo
//
//  Created by 逸风 on 2022/1/1.
//

#import <Foundation/Foundation.h>
#import "GradientLabelDemo-Swift.h"

@interface ConvertGradientImage : NSObject

+ (UIImage *_Nullable)gradientImageWithConfig:(GradientPatternLabelConfig *_Nonnull)config size:(CGSize)size;

@end

