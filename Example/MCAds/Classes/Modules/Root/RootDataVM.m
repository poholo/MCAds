//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "RootDataVM.h"
#import "AdCateDto.h"


@implementation RootDataVM

- (void)reqHomeData:(NSInteger)index callBack:(void (^)(BOOL succcess, NSArray *dataList))callBack {
    [self.dataList removeAllObjects];
    NSString *path = [self jsonFilePath:index];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    for (NSDictionary *tmDict in dictionary[@"data"]) {
        AdCateDto *dto = [AdCateDto createDto:tmDict];
        [self.dataList addObject:dto];
    }

    if (callBack) {
        callBack(error ? NO : YES, self.dataList);
    }
}

- (NSString *)jsonFilePath:(NSInteger)index {
    NSString *file;
    if (index == 0) {
        file = @"RootData_Baidu.json";
    } else if (index == 1) {
        file = @"RootData_GDT.json";
    } else if (index == 2) {
        file = @"RootData_Custom.json";
    }
    return [[NSBundle mainBundle] pathForResource:file ofType:nil];
}

#pragma mark - getter

- (NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}
@end
