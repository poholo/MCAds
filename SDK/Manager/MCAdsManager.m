//
// Created by majiancheng on 15/12/8.
// Copyright (c) 2015 poholo. All rights reserved.
//


#import "MCAdsManager.h"

#import <GDTAd/GDTTrack.h>

#import "MCAdDto.h"
#import "MCMobileAdService.h"
#import "MCAdConfig.h"
#import "NSObject+AdApi.h"
#import "MCSplashService.h"


@interface MCAdsManager ()

@property(nonatomic, strong) MCAdConfig *preConfig;
@property(nonatomic, strong) MCAdConfig *splashConfig;

@property(nonatomic, strong) MCMobileAdService *preAdService;
@property(nonatomic, strong) MCMobileAdService *flowAdService;
@property(nonatomic, strong) MCMobileAdService *playerPauseAdService;
@property(nonatomic, strong) MCSplashService *splashService;

@end

@implementation MCAdsManager

+ (MCAdsManager *)share {
    static MCAdsManager *_instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _instance = [[self alloc] init];
    });

    return _instance;
}

- (void)activateApp {
    switch (self.splashConfig.adSourceType) {
        case AdSourceBaidu: {

        }
            break;
        case AdSourceInmmobi: {

        }
            break;
        case AdSourceTencent: {
            [GDTTrack activateApp];
        }
            break;
        default: {
        }
            break;
    }

}


- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (MCAdConfig *)splashConfig {
    if (_splashConfig == nil) {
        _splashConfig = [self localConfig:SSPSplash];
    }

    return _splashConfig;
}

- (MCAdConfig *)findSuitConfigFromData:(id)data sspAdType:(SSPAdType)adType {
    if ([data isKindOfClass:[NSArray class]] && ((NSArray *) data).count > 0) {
        return [MCAdConfig createDto:((NSArray *) data).firstObject];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        return [MCAdConfig createDto:data];
    } else {

    }
    return nil;
}

- (MCAdConfig *)localConfig:(SSPAdType)adType {
    switch (adType) {
        case SSPSplash: {
            return [MCAdConfig createSplashDefault];
        }
            break;
        case SSPDataFlow: {
            return [MCAdConfig createDataFlow];
        }
            break;
        case SSPDataPre : {
            return [MCAdConfig createPreConfig];
        }
            break;
        case SSPDataPause: {
            return [MCAdConfig createPauseConfig];
        }
            break;
        default: {
        }
            break;
    }
    return nil;
}

- (void)loadConfig {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingPathComponent:@"MCAdConfig.json"];
    NSDictionary *result = [NSDictionary dictionaryWithContentsOfFile:fileName];
    NSDictionary *config = result[@"adConfig"];
    if (config) {
        [self __loadCommenFactory:config];
        [self requestAllData];
    }
    [self loadNextConfig];
}

- (void)loadNextConfig {
    //获取下一次的配置
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingPathComponent:@"MCAdConfig.json"];

    __weak typeof(self) weakSelf = self;
    [self apiAdConfigMaterial:^(BOOL success, NSDictionary *dict) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (success) {
            NSDictionary *config = dict[@"adConfig"];
            [self __loadCommenFactory:config];
            [dict writeToFile:fileName atomically:YES];
            [self requestAllData];
        } else {
            if (self.preConfig == nil) {
                self.preConfig = [self localConfig:SSPDataPre];
            }

            if (self.splashConfig == nil) {
                self.splashConfig = [self localConfig:SSPSplash];
            }

            if (self.flowAdService == nil || self.flowAdService.adConfig == nil) {
                self.flowAdService = [[MCMobileAdService alloc] initWithConfig:[self localConfig:SSPDataFlow]
                                                                        adType:SSPDataFlow delegate:nil];
            }

            if (self.playerPauseAdService == nil || self.playerPauseAdService.adConfig == nil) {
                self.playerPauseAdService = [[MCMobileAdService alloc] initWithConfig:[self localConfig:SSPDataPause]
                                                                               adType:SSPDataPause delegate:nil];
            }

            [self requestAllData];
        }
    }];

}

- (void)__loadCommenFactory:(NSDictionary *)dict {

    NSDictionary *pre = dict[@"dataPre"];
    NSDictionary *splash = dict[@"splash"];
    NSDictionary *flow = dict[@"dataFlow"];
    NSDictionary *dataPause = dict[@"dataPause"];

    self.preConfig = [self findSuitConfigFromData:pre sspAdType:SSPDataPre];
    self.splashConfig = [self findSuitConfigFromData:splash sspAdType:SSPSplash];

    self.preAdService = [[MCMobileAdService alloc] initWithConfig:[self findSuitConfigFromData:pre sspAdType:SSPDataPre]
                                                           adType:SSPDataPre delegate:nil];

    self.flowAdService = [[MCMobileAdService alloc] initWithConfig:[self findSuitConfigFromData:flow sspAdType:SSPDataFlow]
                                                            adType:SSPDataFlow delegate:nil];

    self.playerPauseAdService = [[MCMobileAdService alloc] initWithConfig:[self findSuitConfigFromData:dataPause sspAdType:SSPDataPause]
                                                                   adType:SSPDataPause delegate:nil];
}

- (void)requestAllData {
    [self.flowAdService requestNativeAds];
    [self.playerPauseAdService requestNativeAds];
}

- (void)requestNativeAds:(SSPAdType)adType {
    switch (adType) {
        case SSPSplash : {

        }
            break;
        case SSPDataFlow : {
            [self.flowAdService requestNativeAds];
        }
            break;
        case SSPDataPre : {
        }
            break;
        case SSPDataPause : {
            [self.playerPauseAdService requestNativeAds];
        }
            break;
    }
}

- (MCAdDto *)takeOneAd:(SSPAdType)adType {
    switch (adType) {
        case SSPSplash : {

        }
            break;
        case SSPDataFlow : {
            return [self.flowAdService takeOneAd];
        }
            break;
        case SSPDataPre : {
        }
            break;
        case SSPDataPause : {
            return [self.playerPauseAdService takeOneAd];
        }
            break;
    }
    return nil;
}

- (NSString *)apIdAdType:(SSPAdType)adType {
    switch (adType) {
        case SSPSplash : {

        }
            break;
        case SSPDataFlow : {
            return [self.flowAdService apId];
        }
            break;
        case SSPDataPre : {
            return [self.preAdService apId];
        }
            break;
        case SSPDataPause : {
            return [self.playerPauseAdService apId];
        }
            break;
    }
    return nil;
}

- (AdDisplayStyleType)styleId:(SSPAdType)adType {
    switch (adType) {
        case SSPSplash : {

        }
            break;
        case SSPDataFlow : {
            return [self.flowAdService adConfig].styleId;
        }
            break;
        case SSPDataPre : {
        }
            break;
        case SSPDataPause : {
            return [self.playerPauseAdService adConfig].styleId;
        }
            break;
    }
    return AdDisplayStyleLittle;
}


- (void)updoateRefer:(SSPAdType)adType refer:(NSString *)refer {
    switch (adType) {
        case SSPSplash : {

        }
            break;
        case SSPDataFlow : {
            [self.flowAdService updateRefer:refer];
        }
            break;
        case SSPDataPre : {
        }
            break;
        case SSPDataPause : {
        }
            break;
    }
}

#pragma mark - getter

- (MCSplashService *)splashService {
    if (!_splashService) {
        _splashService = [MCSplashService new];
    }
    return _splashService;
}

@end
