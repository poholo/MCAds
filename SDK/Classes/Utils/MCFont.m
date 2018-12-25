//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "MCFont.h"

#import "MCAdsManager.h"
#import "MCFontConfig.h"

@implementation MCFont

+ (UIFont *)fontI {
    UIFont *custom = [MCAdsManager share].fontConfig.fontI;
    if (custom) {
        return custom;
    }
    return [UIFont systemFontOfSize:10];
}

+ (UIFont *)fontII {
    UIFont *custom = [MCAdsManager share].fontConfig.fontII;
    if (custom) {
        return custom;
    }
    return [UIFont systemFontOfSize:12];
}

+ (UIFont *)fontIII {
    UIFont *custom = [MCAdsManager share].fontConfig.fontIII;
    if (custom) {
        return custom;
    }
    return [UIFont boldSystemFontOfSize:12];
}

+ (UIFont *)fontIV {
    UIFont *custom = [MCAdsManager share].fontConfig.fontIV;
    if (custom) {
        return custom;
    }
    return [UIFont boldSystemFontOfSize:14];
}


@end