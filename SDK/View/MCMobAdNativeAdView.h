//
//  MCMobAdNativeAdView.h
//  MCAds
//
//  Created by poholo on 16/2/3.
//  Copyright © 2016年 poholo Inc. All rights reserved.
//


#import <BaiduMobAdSDK/BaiduMobAdNativeAdView.h>

@interface MCMobAdNativeAdView : BaiduMobAdNativeAdView

@property(nonatomic, copy) NSString * referId;
@property(nonatomic, copy) NSString * adid;
@property(nonatomic, copy) NSString * type;
@property(nonatomic, assign) NSInteger postion;
@property(nonatomic, copy) NSString * resq;
@property(nonatomic, copy) NSString * title;
@property(nonatomic, assign) NSInteger picType;

@end
