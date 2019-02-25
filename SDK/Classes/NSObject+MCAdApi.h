//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCAdDef.h"

/***
 * 广告接口
 */
@interface NSObject (MCAdApi)

/**
 * 广告素材接口，用来配置开屏、信息流、播放页前贴广告配置（素材：source-百度、广点通等）
 * @param callBack 回调
 */
- (void)apiAdConfigMaterial:(void (^)(BOOL success, NSDictionary *dict))callBack;


/**
 * 通过广告来源类型获取广告素材接口，用来配置开屏、信息流、播放页前贴广告配置（素材：source-百度、广点通等）
 * @param callBack 回调
 */
- (void)apiAdConfigMaterialSourceType:(MCAdSourceType)sourceType callBack:(void (^)(BOOL success, NSDictionary *dict))callBack;

- (void)apiReqCustomAds:(NSInteger)num callBack:(void (^)(BOOL success, NSDictionary *))callBack;

@end