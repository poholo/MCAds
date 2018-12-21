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

- (instancetype)initWithNativeAdDto:(id)dto styleId:(MCAdStyleType)styleId {
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

- (MCAdSourceType)adSourceType {
    NSString *source = self.nativeAdDto.source;
    MCAdSourceType type = MCAdSourceTencent;
    if ([source isEqualToString:@"baidu"]) {
        type = MCAdSourceBaidu;
    } else if ([source isEqualToString:@"gdt"]) {
        type = MCAdSourceTencent;
    } else if ([source isEqualToString:@"inmmob"]) {
        type = MCAdSourceInmmobi;
    } else {
        type = MCAdSourceTencent;
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
        case MCAdSourceBaidu: {
            adrefer = [refer stringByAppendingString:@"_bdad"];
        }
            break;
        case MCAdSourceTencent : {
            adrefer = [refer stringByAppendingString:@"_gdt"];
        }
            break;
        case MCAdSourceInmmobi: {
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
