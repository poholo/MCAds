//
//  MCSplashDto.h
//  MCAds
//
//  Created by majiancheng on 2017/8/30.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MCDto.h"

@class MCLiveAdDto;
@class MCAdConfig;
@class MCAdvertisementDto;

typedef NS_ENUM(NSInteger, SplashType) {
    SplashTypeBaidu,
    SplashTypeWaQuImage,
    SplashTypeWaQuVideo,
    SPlashTypeTencent
};

@interface MCSplashDto : MCDto

@property(nonatomic, assign) SplashType splashType;

@property(nonatomic, strong) MCAdvertisementDto *advertisementDto;

@property(nonatomic, strong) MCLiveAdDto *liveAdDto;

@property(nonatomic, assign) BOOL skipType;

@property(nonatomic, assign) NSInteger duration;

@property(nonatomic, strong) NSNumber *resq;

@property(nonatomic, strong) NSString *source;


+ (MCSplashDto *)convertByAdConfig:(MCAdConfig *)adConfig;

@end
