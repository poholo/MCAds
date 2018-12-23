//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "MCColor.h"


@implementation MCColor


+ (UIColor *)colorI {
    return [MCColor colorWithHexInt:0x333333];
}

+ (UIColor *)colorII {
    return [MCColor colorWithHexInt:0x666666];
}

+ (UIColor *)colorIII {
    return [MCColor colorWithHexInt:0x999999];
}

+ (UIColor *)colorIV {
    return [MCColor colorWithHexInt:0xcacaca];
}

+ (UIColor *)colorV {
    return [MCColor colorWithHexInt:0xf7f7f9];
}

+ (UIColor *)colorVI {
    return [MCColor colorWithHexInt:0xdedede];
}

+ (UIColor *)colorVII {
    return [MCColor colorWithHexInt:0x76bdff];
}

+ (UIColor *)colorVIII {
    return [MCColor colorWithHexInt:0xffbc1c];
}

+ (UIColor *)colorIX {
    return [MCColor colorWithHexInt:0x7789a8];
}

+ (UIColor *)colorX {
    return [MCColor colorWithHexInt:0xebf2fa];
}

+ (UIColor *)colorXI {
    return [MCColor colorWithHexInt:0x30c84d];
}

+ (UIColor *)colorXII {
    return [MCColor colorWithHexInt:0xff6d69];
}


+ (UIColor *)randomImageColor {
    static dispatch_once_t once_t;
    static NSMutableArray *randomColors;
    dispatch_once(&once_t, ^{
        randomColors = [NSMutableArray array];
        [randomColors addObject:[MCColor colorWithHexInt:0x77B2CF]];
        [randomColors addObject:[MCColor colorWithHexInt:0x7EA3B0]];
        [randomColors addObject:[MCColor colorWithHexInt:0xA99DCA]];
        [randomColors addObject:[MCColor colorWithHexInt:0x7F9DC1]];
        [randomColors addObject:[MCColor colorWithHexInt:0x98CAAE]];
        [randomColors addObject:[MCColor colorWithHexInt:0xE2D0EB]];
    });

    return randomColors[arc4random() % 6];
}

+ (UIColor *)colorWithHexInt:(NSUInteger)rgbValue {
    return [UIColor colorWithRed:(CGFloat) (((float) ((rgbValue & 0xFF0000) >> 16)) / 255.0)
                           green:(CGFloat) (((float) ((rgbValue & 0xFF00) >> 8)) / 255.0)
                            blue:(CGFloat) (((float) (rgbValue & 0xFF)) / 255.0)
                           alpha:1.0];
}

@end