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

@interface MCMobileSSP : NSObject

@property(nonatomic, readonly) MCAdConfig *preConfig;
@property(nonatomic, readonly) MCAdConfig *splashConfig;

@property(nonatomic, readonly) MCMobileAdService *flowAdService;
@property(nonatomic, readonly) MCMobileAdService *playerPauseAdService;

+ (MCMobileSSP *)sharedInstance;

- (void)activateApp;

- (void)loadConfig;

- (void)loadNextConfig;

- (void)requestNativeAds:(SSPAdType)adType;

- (MCAdDto *)takeOneAd:(SSPAdType)adType;

- (NSString *)apIdAdType:(SSPAdType)adType;

- (AdDisplayStyleType)styleId:(SSPAdType)adType;

- (void)updoateRefer:(SSPAdType)adType refer:(NSString *)refer;


@end
