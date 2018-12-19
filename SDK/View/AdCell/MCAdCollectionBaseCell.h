//
// Created by majiancheng on 2017/5/24.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCCollectionCell.h"
#import "MCAdBaseDelegate.h"

@class MCAdBaseView;

/***
 * CollectionViewCell 广告基类
 * */
@interface MCAdCollectionBaseCell : MCCollectionCell <MCAdBaseDelegate>

@property(nonatomic, readonly) MCAdBaseView *baseView;

@property(nonatomic, readonly) UIImageView *picImageView;
@property(nonatomic, readonly) UILabel *titleLabel;
@property(nonatomic, readonly) UILabel *infoLabel;
@property(nonatomic, readonly) UILabel *popularizeLabel;
@property(nonatomic, readonly) UIImageView *logoView;
@property(nonatomic, readonly) UIImageView *adImageView;

- (void)cellLogPostion:(NSInteger)postion;

- (void)setAdModel:(MCAdDto *)model;

+ (NSString *)identifier;

+ (CGSize)size;

@end
