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

+ (void)mainExecute:(dispatch_block_t)block {
    if ([NSThread isMainThread]) {
        if (block) {
            block();
        }
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
    }
}

@end