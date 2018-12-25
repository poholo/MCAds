//
// Created by majiancheng on 2018/12/25.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCAdDef.h"

typedef NSDictionary *(^ApiAdConfigMaterialCallBack)(void);

typedef NSDictionary *(^ApiAdConfigMaterialSourceTypeCallBack)(MCAdSourceType type);

typedef NSDictionary *(^ApiReqCustomAdsCallBack)(NSInteger num);

@interface MCApiConfig : NSObject
/**
 * 广告素材接口，用来配置开屏、信息流、播放页前贴广告配置（素材：source-百度、广点通等）
 * @return NSDictionary like {"success": true, "data": {"success": true, "adConfig":{ "splash": {}, "dataFlow": {}, "dataPre": {} }}
 * @param splash dataFlow dataPre 请参照: AdInfos_baidu.json / AdInfos_Custom.json / AdInfos_GDT.json
 */
@property(nonatomic, copy) ApiAdConfigMaterialCallBack apiAdConfigMaterialCallBack;
/**
 * 通过广告来源类型获取广告素材接口，用来配置开屏、信息流、播放页前贴广告配置（素材：source-百度、广点通等）
 * @return NSDictionary like {"success": true, "data": {"success": true, "adConfig":{ "splash": {}, "dataFlow": {}, "dataPre": {} }}
 * @param splash dataFlow dataPre 请参照: AdInfos_baidu.json / AdInfos_Custom.json / AdInfos_GDT.json
 */
@property(nonatomic, copy) ApiAdConfigMaterialSourceTypeCallBack apiAdConfigMaterialSourceTypeCallBack;

/**
 * 自定义广告部分，通过num返回广告字典
 * @return NSDictionary like {"success": true, "data": {"success": true, "data":[]}}
 * @param data 请参照 DataFlow_Custom_Ads.json
 */
@property(nonatomic, copy) ApiReqCustomAdsCallBack apiReqCustomAdsCallBack;

@end