//
// Created by majiancheng on 2018/12/25.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "MCStyle.h"

#import "MCAdsManager.h"
#import "MCStyleConfig.h"

@implementation MCStyle

+ (UIEdgeInsets)contentInset {
    NSValue *insets = [MCAdsManager share].styleConfig.contentInset;
    if (insets) {
        return [insets UIEdgeInsetsValue];
    }
    return UIEdgeInsetsMake(5, 12, 5, 12);
}

+ (CGFloat)cornorRadius {
    NSNumber * cornorRadius = [MCAdsManager share].styleConfig.cornorRadius;
    if (cornorRadius) {
        return cornorRadius.floatValue;
    }
    return 5;
}

@end