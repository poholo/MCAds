//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "MCColor.h"

#import "MCAdsManager.h"
#import "MCColorConfig.h"


@implementation MCColor


+ (UIColor *)colorI {
    UIColor *custom = [MCAdsManager share].colorConfig.colorI;
    if (custom) {
        return custom;
    }
    return [MCColor rgb:0x333333];
}

+ (UIColor *)colorII {
    UIColor *custom = [MCAdsManager share].colorConfig.colorII;
    if (custom) {
        return custom;
    }
    return [MCColor rgb:0x666666];
}

+ (UIColor *)colorIII {
    UIColor *custom = [MCAdsManager share].colorConfig.colorIII;
    if (custom) {
        return custom;
    }
    return [MCColor rgb:0x999999];
}


+ (UIColor *)colorV {
    UIColor *custom = [MCAdsManager share].colorConfig.colorV;
    if (custom) {
        return custom;
    }
    return [MCColor rgb:0xf7f7f9];
}

+ (UIColor *)colorVI {
    UIColor *custom = [MCAdsManager share].colorConfig.colorVI;
    if (custom) {
        return custom;
    }
    return [MCColor rgb:0xdedede];
}

+ (UIColor *)randomImageColor {
    static dispatch_once_t once_t;
    static NSMutableArray *randomColors;
    dispatch_once(&once_t, ^{
        randomColors = [NSMutableArray array];
        [randomColors addObject:[MCColor rgb:0x77B2CF]];
        [randomColors addObject:[MCColor rgb:0x7EA3B0]];
        [randomColors addObject:[MCColor rgb:0xA99DCA]];
        [randomColors addObject:[MCColor rgb:0x7F9DC1]];
        [randomColors addObject:[MCColor rgb:0x98CAAE]];
        [randomColors addObject:[MCColor rgb:0xE2D0EB]];
    });

    return randomColors[arc4random() % 6];
}

+ (UIColor *)rgb:(NSUInteger)rgbValue {
    return [UIColor colorWithRed:(CGFloat) (((float) ((rgbValue & 0xFF0000) >> 16)) / 255.0)
                           green:(CGFloat) (((float) ((rgbValue & 0xFF00) >> 8)) / 255.0)
                            blue:(CGFloat) (((float) (rgbValue & 0xFF)) / 255.0)
                           alpha:1.0];
}

@end