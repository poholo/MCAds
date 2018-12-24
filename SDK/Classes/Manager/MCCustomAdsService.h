//
// Created by majiancheng on 2018/12/24.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MCAdDto;


@interface MCCustomAdsService : NSObject

- (void)req:(NSInteger)num callBack:(void (^)(BOOL success, NSArray<MCAdDto *> *dtos))callBack;

@end