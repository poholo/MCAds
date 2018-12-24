//
//  MCSplashDto.h
//  MCAds
//
//  Created by majiancheng on 2017/8/30.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MCDto.h"

@class MCAdConfig;
@class MCAdvertisementDto;

typedef NS_ENUM(NSInteger, MCSplashType) {
    MCSplashTypeBaidu,
    MCSplashTypeTencent,
    MCSplashTypeCustomImage,
    MCSplashTypeCustomVideo,
};

@interface MCSplashDto : MCDto

@property(nonatomic, assign) MCSplashType splashType;

@property(nonatomic, strong) MCAdvertisementDto *advertisementDto;

@property(nonatomic, assign) BOOL skipType;

@property(nonatomic, assign) NSInteger duration;

@property(nonatomic, strong) NSNumber *resq;

@property(nonatomic, strong) NSString *source;

+ (MCSplashDto *)convertByAdConfig:(MCAdConfig *)adConfig;

@end
