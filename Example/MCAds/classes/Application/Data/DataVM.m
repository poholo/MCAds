//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "DataVM.h"
#import "MCDto.h"


@implementation DataVM

- (void)refresh {
    self.isRefresh = YES;
    self.currentPos = 0;

}

- (NSMutableArray<MCDto *> *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}
@end