//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MCDto;


@interface DataVM : NSObject

@property(nonatomic, strong) NSMutableArray<MCDto *> *dataList;
@property(nonatomic, assign) BOOL isRefresh;
@property(nonatomic, assign) NSInteger currentPos;

- (void)refresh;

@end