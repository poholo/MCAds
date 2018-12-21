//
// Created by majiancheng on 2017/5/24.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MCAdDef.h"

@class MCAdDto;

/***
 * 广告展示最基本样式 适合所有的view调用，自己完成frame布局
 */
@interface MCAdBaseView : UIView

@property(nonatomic, readonly) UIImageView *picImageView;
@property(nonatomic, readonly) UILabel *titleLabel;
@property(nonatomic, readonly) UILabel *infoLabel;
@property(nonatomic, readonly) UILabel *popularizeLabel;
@property(nonatomic, readonly) UIImageView *logoView;
@property(nonatomic, readonly) UIImageView *adImageView;

@property(nonatomic, strong) NSIndexPath *indexPath;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, assign) MCAdStyleType picType;
@property(nonatomic, copy) NSString *referId;
@property(nonatomic, strong) NSString *apId;

- (void)setAdModel:(MCAdDto *)model;

- (void)trackImpression;

- (void)clickAd;

@end
