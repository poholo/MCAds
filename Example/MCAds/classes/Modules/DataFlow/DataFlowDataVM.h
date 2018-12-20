//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "DataVM.h"

@class RootCateDto;


@interface DataFlowDataVM : DataVM

@property (nonatomic, weak) RootCateDto * cateDto;

- (void)reqDataFlow:(void (^)(BOOL success, NSMutableArray *dataList))callBack;

@end