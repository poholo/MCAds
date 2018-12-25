//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "NSString+Extend.h"


@implementation NSString (Extend)

- (CGSize)size4size:(CGSize)size font:(UIFont *)font {
    CGFloat maxWidth = size.width;
    CGSize maxSize = CGSizeMake(maxWidth, CGFLOAT_MAX);
    CGSize textSize = CGSizeZero;
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;

    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];

    NSDictionary *attributes = @{NSFontAttributeName: font, NSParagraphStyleAttributeName: style};

    CGRect rect = [self boundingRectWithSize:maxSize
                                     options:opts
                                  attributes:attributes
                                     context:nil];
    textSize = rect.size;
    return textSize;
}

@end