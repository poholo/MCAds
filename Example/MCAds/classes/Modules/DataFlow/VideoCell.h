//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "MCTableCell.h"

@class VideoDto;


@interface VideoCell : MCTableCell

- (void)loadData:(VideoDto *)dto;

@end