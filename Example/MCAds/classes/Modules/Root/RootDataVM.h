//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RootDataVM : NSObject

@property(nonatomic, strong) NSMutableArray *dataList;

- (void)reqHomeData:(void (^)(BOOL succcess, NSArray *dataList))callBack;

@end