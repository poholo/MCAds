//
// Created by majiancheng on 15/12/8.
// Copyright (c) 2015 poholo. All rights reserved.
//
#import "MCNativeAdDto.h"

#import "MCAdDef.h"

@class MCAdConfig;
@class MCLiveAdDto;
@class MCAdDto;
@class MCMobileAdService;
@class MCSplashService;

@interface MCAdsManager : NSObject

@property(nonatomic, readonly) MCAdConfig *preConfig;
@property(nonatomic, readonly) MCAdConfig *splashConfig;
@property(nonatomic, readonly) MCMobileAdService *flowAdService;
@property(nonatomic, readonly) MCMobileAdService *playerPauseAdService;
@property(nonatomic, readonly) MCSplashService *splashService;

+ (MCAdsManager *)share;

- (void)activateApp;

- (void)loadConfig;

- (void)loadNextConfig;

- (void)changeConfig:(AdSourceType)sourceType;

- (void)requestNativeAds:(SSPAdType)adType;

- (MCAdDto *)takeOneAd:(SSPAdType)adType;

- (NSString *)apIdAdType:(SSPAdType)adType;

- (void)updoateRefer:(SSPAdType)adType refer:(NSString *)refer;


@end
