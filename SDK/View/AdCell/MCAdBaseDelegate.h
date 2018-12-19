//
// Created by majiancheng on 2017/5/24.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCAdDef.h"

@class MCAdDto;

@protocol MCAdBaseDelegate <NSObject>

- (void)setAdPostion:(NSIndexPath *)indexPath;

- (void)setAdType:(NSString *)adType;

- (void)setAdPicType:(AdDisplayStyleType)picType;

- (void)setAdRefer:(NSString *)refreId;

- (void)setAdModel:(MCAdDto *)model;

- (void)trackImpression;

- (void)updateStyle;

- (NSString *)apId;

@optional
- (void)clickAd;


@end