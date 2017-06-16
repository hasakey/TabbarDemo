//
//  UIImage+Extensions.m
//  EducationPlatform
//
//  Created by 同筑科技 on 2017/5/12.
//  Copyright © 2017年 well. All rights reserved.
//

#import "UIImage+Extensions.h"

@implementation UIImage (Extensions)

+(UIImage*) createImageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
