//
//  MCSplashDto.m
//  MCAds
//
//  Created by majiancheng on 2017/8/30.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MCSplashDto.h"

#import "MCAdConfig.h"
#import "MCAdvertisementDto.h"

@implementation MCSplashDto

- (instancetype)init {
    self = [super init];
    if (self) {
        self.resq = nil;
    }
    return self;
}

+ (MCSplashDto *)convertByAdConfig:(MCAdConfig *)adConfig {
    MCSplashDto *splashDto = [[MCSplashDto alloc] init];
    splashDto.source = adConfig.source;
    splashDto.advertisementDto = adConfig.advertisementDto;
    return splashDto;
}


- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"custom"]) {
        self.advertisementDto = [MCAdvertisementDto createDto:value];
    }
}

- (NSString *)entityId {
    return self.advertisementDto.entityId;
}

- (MCSplashType)splashType {
    if (self.advertisementDto.videoUrl) {
        return MCSplashTypeCustomVideo;
    } else if (self.advertisementDto.imageUrl) {
        return MCSplashTypeCustomVideo;
    } else if ([self.source isEqualToString:@"baidu"]) {
        return MCSplashTypeBaidu;
    } else if ([self.source isEqualToString:@"gdt"]) {
        return MCSplashTypeTencent;
    } else {
        return MCSplashTypeTencent;
    }
}

@end
