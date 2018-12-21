//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "MCDto.h"


@interface AdCateDto : MCDto

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *file;

@property(nonatomic, strong) NSMutableArray<AdCateDto *> *cateDtos;

@end
