//
// Created by majiancheng on 2018/12/24.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (MCExtend)

- (void)mc_open:(void (^)(BOOL success, NSError *error))callBack;

@end