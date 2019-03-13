//
// Created by majiancheng on 2019/3/13.
// Copyright (c) 2019 majiancheng. All rights reserved.
//

#import "MCAdUtils.h"


@implementation MCAdUtils

+ (UIViewController *)topController {
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *nav;
    if ([root isKindOfClass:[UINavigationController class]]) {
        nav = (UINavigationController *) root;
    } else {
        nav = root.navigationController;
    }
    return nav.topViewController;
}

@end