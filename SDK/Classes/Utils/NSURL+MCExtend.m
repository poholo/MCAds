//
// Created by majiancheng on 2018/12/24.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "NSURL+MCExtend.h"

#import <UIKit/UIKit.h>


@implementation NSURL (MCExtend)

- (void)mc_open:(void (^)(BOOL success, NSError *error))callBack {
    if ([UIDevice currentDevice].systemVersion.floatValue > 10.0) {
        [[UIApplication sharedApplication] openURL:self options:@{} completionHandler:^(BOOL success) {
            if (success) {
                MCLog(@"已经安装了，直接打开了");
            } else {
                NSURL *appStoreUrl = [NSURL URLWithString:self.url];
                [[UIApplication sharedApplication] openURL:appStoreUrl options:@{} completionHandler:^(BOOL success) {
                    if (success) {
                        MCLog(@"打开Appstore下载页面");
                    } else {
                        MCLog(@"Appstore地址有误");
                    }
                }];
            }
        }];
    } else {
        BOOL success = [[UIApplication sharedApplication] openURL:url];
        if (success) {
            MCLog(@"已经安装了，直接打开了");
        } else {
            NSURL *appStoreUrl = [NSURL URLWithString:self.url];
            BOOL appsuccess = [[UIApplication sharedApplication] openURL:appStoreUrl];
            if (appsuccess) {
                MCLog(@"打开Appstore下载页面");
            } else {
                MCLog(@"open url failed");
            }
        }
    }
}

@end