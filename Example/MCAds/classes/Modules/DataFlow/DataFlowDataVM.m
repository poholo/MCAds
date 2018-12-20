//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "DataFlowDataVM.h"

#import "RootCateDto.h"
#import "VideoDto.h"


@implementation DataFlowDataVM

- (void)reqDataFlow:(void (^)(BOOL success, NSMutableArray *dataList))callBack {
    NSString *path = [self jsonPath];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    for (NSDictionary *tmDict in dictionary[@"data"]) {
        VideoDto *dto = [VideoDto createDto:tmDict];
        [self.dataList addObject:dto];
    }

    if (callBack) {
        callBack(error ? NO : YES, self.dataList);
    }
}

- (NSString *)jsonPath {
    NSString *jsonPath;
    if ([self.cateDto.entityId isEqualToString:@"1"]) {
        jsonPath = [[NSBundle mainBundle] pathForResource:@"DataFlow_big" ofType:@"json"];
    } else if ([self.cateDto.entityId isEqualToString:@"2"]) {
        jsonPath = [[NSBundle mainBundle] pathForResource:@"DataFlow_small" ofType:@"json"];
    } else if ([self.cateDto.entityId isEqualToString:@"3"]) {
        jsonPath = [[NSBundle mainBundle] pathForResource:@"DataFlow_mix" ofType:@"json"];
    } else if ([self.cateDto.entityId isEqualToString:@"4"]) {
        jsonPath = [[NSBundle mainBundle] pathForResource:@"DataFlow_video" ofType:@"json"];
    }
    return jsonPath;
}


@end