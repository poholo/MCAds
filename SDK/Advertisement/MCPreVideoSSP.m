//
//  MCPreVideoSSP.m
//  MCAds
//
//  Created by majiancheng on 2017/5/12.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//


#import "MCPreVideoSSP.h"

#import "MCAdConfig.h"
#import "MCMobileAdService.h"

@interface MCPreVideoSSP ()

@property(nonatomic, strong) MCMobileAdService *adService;


@end

@implementation MCPreVideoSSP
+ (instancetype)sharedInstance {
    static dispatch_once_t predicate;
    static MCPreVideoSSP *preVideoSSP = nil;
    dispatch_once(&predicate, ^{
        preVideoSSP = [[MCPreVideoSSP alloc] init];
    });
    return preVideoSSP;
}

- (void)updateAdConfig:(MCAdConfig *)adConfig {
    self.adService.adConfig = adConfig;
    [self.adService requestNativeAds];
}

- (void)requestAdsTarget:(id <MobileAdServiceDelegate>)delegate nums:(NSUInteger)nums {
    [self.adService requestAdsTarget:delegate nums:nums];
}

- (NSString *)apId {
    return self.adService.adConfig.entityId;
}


#pragma mark - getter

- (MCMobileAdService *)adService {
    if (!_adService) {
        _adService = [[MCMobileAdService alloc] initWithConfig:nil adType:SSPDataPre delegate:nil];
    }
    return _adService;
}
@end
