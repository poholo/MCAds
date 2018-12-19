//
// Created by majiancheng on 16/4/16.
// Copyright (c) 2016 poholo. All rights reserved.
//

#import "MCAdDto.h"

#import "MCNativeAdDto.h"
#import "MCInmobiDto.h"
#import "MCAdDef.h"
#import "MCMobileAdService.h"


@implementation MCAdDto

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSString *)title {
    return _nativeAdDto.title;
}

- (instancetype)initWithNativeAdDto:(id)dto styleId:(AdDisplayStyleType)styleId {
    self = [super init];
    if (self) {
        if ([dto isKindOfClass:[MCNativeAdDto class]]) {
            self.nativeAdDto = dto;
        }
        self.lastTimeInterval = [[NSDate date] timeIntervalSince1970];
        self.styleId = styleId;
    }

    return self;
}

- (AdSourceType)adSourceType {
    NSString *source = self.nativeAdDto.source;
    AdSourceType type = AdSourceTencent;
    if ([source isEqualToString:@"baidu"]) {
        type = AdSourceBaidu;
    } else if ([source isEqualToString:@"gdt"]) {
        type = AdSourceTencent;
    } else if ([source isEqualToString:@"inmmob"]) {
        type = AdSourceInmmobi;
    } else {
        type = AdSourceTencent;
    }
    return type;
}

- (NSString *)entityId {
    return _nativeAdDto.entityId;
}

- (CGSize)waterCellSize:(CGFloat)defaultWidth {
    return [self.nativeAdDto waterCellSize:defaultWidth];
}

- (NSString *)adrefer:(NSString *)refer {
    NSString *adrefer = refer;
    switch (self.adSourceType) {
        case AdSourceBaidu: {
            adrefer = [refer stringByAppendingString:@"_bdad"];
        }
            break;
        case AdSourceTencent : {
            adrefer = [refer stringByAppendingString:@"_gdt"];
        }
            break;
        case AdSourceInmmobi: {
            adrefer = [refer stringByAppendingString:@"_imbad"];
        }
            break;
        default: {
            adrefer = [refer stringByAppendingString:@"gdt"];
        }
            break;
    }
    return adrefer;
}

- (BOOL)isExpired {
    return [[NSDate date] timeIntervalSince1970] - self.lastTimeInterval >= 40 * 60;
}

- (NSTimeInterval)lastTimeInterval {
    if (_lastTimeInterval <= 0.0) {
        return [[NSDate date] timeIntervalSince1970];
    }
    return _lastTimeInterval;
}

@end
