//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AdApi)

- (void)apiAdConfigMaterial:(void (^)(BOOL success, NSDictionary *dict))callBack;

@end