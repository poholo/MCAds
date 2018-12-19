//
// Created by majiancheng on 2017/7/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCDto.h"

#import <UIKit/UIKit.h>

@interface MCH5AdDto : MCDto

@property(nonatomic, strong) NSString *bigImg;
@property(nonatomic, strong) NSString *desc;
@property(nonatomic, strong) NSString *userImg;
@property(nonatomic, strong) NSString *userName;
@property(nonatomic, strong) NSString *tag;
@property(nonatomic, strong) NSNumber *upvotedNum;
@property(nonatomic, strong) NSString *h5Url;
@property(nonatomic, copy) NSString *targetTab;

- (CGSize)size;

- (BOOL)isLive;

@end
