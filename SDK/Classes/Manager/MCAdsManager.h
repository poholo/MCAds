//
// Created by majiancheng on 15/12/8.
// Copyright (c) 2015 poholo. All rights reserved.
//
#import "MCNativeAdDto.h"

#import "MCAdDef.h"

@class MCAdConfig;
@class MCAdDto;
@class MCMobileAdService;
@class MCSplashService;
@class MCApiConfig;
@class MCColorConfig;
@class MCStyleConfig;
@class MCFontConfig;

@interface MCAdsManager : NSObject

@property(nonatomic, readonly) MCAdConfig *preConfig;
@property(nonatomic, readonly) MCAdConfig *splashConfig;
@property(nonatomic, readonly) MCMobileAdService *flowAdService;
@property(nonatomic, readonly) MCMobileAdService *playerPauseAdService;
@property(nonatomic, readonly) MCSplashService *splashService;

@property(nonatomic, readonly) MCApiConfig *apiConfig;
@property(nonatomic, readonly) MCColorConfig *colorConfig;
@property(nonatomic, readonly) MCStyleConfig *styleConfig;
@property(nonatomic, readonly) MCFontConfig *fontConfig;

+ (MCAdsManager *)share;

- (void)activateApp;

- (void)loadConfig;

- (void)loadNextConfig;

- (void)changeConfig:(MCAdSourceType)sourceType;

- (void)requestNativeAds:(MCAdCategoryType)adType;

- (MCAdDto *)takeOneAd:(MCAdCategoryType)adType;

- (NSString *)apIdAdType:(MCAdCategoryType)adType;

- (void)updoateRefer:(MCAdCategoryType)adType refer:(NSString *)refer;


@end
