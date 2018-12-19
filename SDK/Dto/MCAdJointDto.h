//
// Created by majiancheng on 2017/5/23.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//


#import "MCDto.h"

#import "MCAdDef.h"

@interface MCAdJointDto : MCDto

@property(nonatomic, assign) NSInteger start;

@property(nonatomic, assign) NSInteger cursor;

@property(nonatomic, assign) NSInteger interval;

@property(nonatomic, assign) BOOL loop;

@property(nonatomic, assign) AdDisplayStyleType styleId;

- (BOOL)avaliable;

@end
