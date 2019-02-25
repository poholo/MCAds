//
// Created by majiancheng on 2017/6/2.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCAdvertisementDto.h"

#import "MCAdDef.h"

@implementation MCAdvertisementDto

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    [super setValue:value forUndefinedKey:key];
    if ([key isEqualToString:@"adid"] || [key isEqualToString:@"id"]) {
        self.entityId = value;
    }
}

- (void)startAction {
    NSURL *url = [NSURL URLWithString:self.packageName];
    switch (self.action) {
        case MCAdvertisementActionDown: {
        }
            break;
        case MCAdvertisementActionOpenWeb: {

        }
            break;
        default:
            break;
    }

    if ([UIDevice currentDevice].systemVersion.floatValue > 10.0) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            if (success) {
                MCLog(@"已经安装了，直接打开了");
            } else {
                NSURL *appStoreUrl = [NSURL URLWithString:self.url];
                [self orientationToPortrait:UIInterfaceOrientationPortrait];
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
            [self orientationToPortrait:UIInterfaceOrientationPortrait];
            BOOL appsuccess = [[UIApplication sharedApplication] openURL:appStoreUrl];
            if (appsuccess) {
                MCLog(@"打开Appstore下载页面");
            } else {
                MCLog(@"open url failed");
            }
        }
    }

}

- (void)orientationToPortrait:(UIInterfaceOrientation)orientation {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

- (BOOL)isCanOpenSchema {
    NSURL *url = [NSURL URLWithString:self.packageName];
    return [[UIApplication sharedApplication] canOpenURL:url];
}

@end