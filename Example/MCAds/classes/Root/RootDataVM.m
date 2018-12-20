//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "RootDataVM.h"
#import "RootCateDto.h"


@implementation RootDataVM

- (void)reqHomeData:(void (^)(BOOL succcess, NSArray *dataList))callBack {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RootData" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    for(NSDictionary * tmDict in dictionary[@"data"]) {
        RootCateDto * dto = [RootCateDto createDto:tmDict];
        [self.dataList addObject:dto];
    }

    if (callBack) {
        callBack(error ? NO : YES, self.dataList);
    }
}

#pragma mark - getter

- (NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}
@end