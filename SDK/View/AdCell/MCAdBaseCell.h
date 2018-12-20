//
//  AdCell.h
//  MCAds
//
//  Created by majiancheng on 15/12/9.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//


#import "MCNativeAdDto.h"

#import <BaiduMobAdSDK/BaiduMobAdNativeAdObject.h>

#import "MCTableCell.h"
#import "MCAdBaseDelegate.h"

@class MCMobAdNativeAdView;
@class MCAdDto;
@class MCInmobiDto;
@class MCAdBaseView;

/****
 * TableviewCell 广告基类
 */
@interface MCAdBaseCell : MCTableCell <MCAdBaseDelegate>

@property(nonatomic, strong) MCAdBaseView *baseView;

@property(nonatomic, readonly) UIImageView *picImageView;
@property(nonatomic, readonly) UILabel *titleLabel;
@property(nonatomic, readonly) UILabel *infoLabel;
@property(nonatomic, readonly) UILabel *popularizeLabel;
@property(nonatomic, readonly) UIImageView *logoView;
@property(nonatomic, readonly) UIImageView *adImageView;


@end
