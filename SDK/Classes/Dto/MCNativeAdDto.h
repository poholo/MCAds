//
//  MCNativeAdDto.h
//  MCAds
//
//  Created by majiancheng on 15/12/28.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//

#import "MCDto.h"

#import <BaiduMobAdSDK/BaiduMobAdNativeAdObject.h>
#import <BaiduMobAdSDK/BaiduMobAdCommonConfig.h>

@class MCInmobiDto;
@class GDTNativeAdData;
@class MCAdvertisementDto;
@class GDTNativeExpressAdView;
@class GDTUnifiedNativeAdDataObject;

@interface MCNativeAdDto : MCDto

@property(nonatomic, readonly) GDTNativeAdData *tencentAdData;
@property(nonatomic, readonly) GDTNativeExpressAdView *tentcentExpressAdView;
@property(nonatomic, readonly) GDTUnifiedNativeAdDataObject *tencentUnifiedNativeAdDataObject;
@property(nonatomic, readonly) BaiduMobAdNativeAdObject *baiduAdData;
@property(nonatomic, readonly) MCInmobiDto *inmobiDto;
@property(nonatomic, readonly) MCAdvertisementDto *customAdvertisementDto;

/**
 * 标题 text
 */
@property(copy, nonatomic) NSString *title;

/**
 * 描述 text
 */
@property(copy, nonatomic) NSString *text;

/**
 * 小图 url
 */
@property(copy, nonatomic) NSString *iconImageURLString;

/**
 * 大图 url
 */
@property(copy, nonatomic) NSString *mainImageURLString;

/**
 * 多图信息流的image url array
 */
@property(strong, nonatomic) NSArray *morepics;

/**
 * 视频url
 */
@property(copy, nonatomic) NSString *videoURLString;

/**
 * 视频时长，单位为s
 */
@property(copy, nonatomic) NSNumber *videoDuration;


/**
 * 开发者配置可接受视频后，对返回的广告单元，需先判断MaterialType再决定使用何种渲染组件
 */
@property MaterialType materialType;

@property(nonatomic, readonly) NSString *source;

/**
 * 是否过期，默认为false，30分钟后过期，需要重新请求广告
 */
- (BOOL)isExpired;

+ (MCNativeAdDto *)creatWithAdNative:(id)adNatvie;

@property(nonatomic, assign) CGSize cacheSize;

- (CGSize)waterCellSize:(CGFloat)defaultWidth;

@end
