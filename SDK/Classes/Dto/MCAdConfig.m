//
//  MCAdConfig.m
//  MCAds
//
//  Created by majiancheng on 15/12/17.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//

#import "MCAdConfig.h"
#import "MCAdvertisementDto.h"

@implementation MCAdConfig
- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"] || [key isEqualToString:@"adid"] || [key isEqualToString:@"adId"]) {
        self.entityId = value;
    } else if ([key isEqualToString:@"custom"]) {
        self.advertisementDto = [MCAdvertisementDto createDto:value];
    }
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

- (MCAdSourceType)adSourceType {
    NSString *source = self.source;
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

- (NSString *)appId {
    if (!_appId) {
        switch (self.adSourceType) {
            case MCAdSourceBaidu: {
                return @"e9f959d6";
            }
                break;
            case MCAdSourceTencent : {
                return @"1106180396";
            }
                break;
            case MCAdSourceInmmobi: {
                return @"";
            }
                break;
            default: {
                return @"1106180396";
            }
                break;
        }
    }
    return _appId;
}


+ (MCAdConfig *)createSplashDefault {
    MCAdConfig *obj = [MCAdConfig new];
    obj.entityId = @"2390225";
    obj.cardBlow = 0;
    obj.duration = 5;
    obj.interval = 5;
    obj.loop = YES;
    obj.refer = @"Default";
    obj.skip = YES;
    obj.start = 1;
    obj.source = @"Default";
    return obj;
}

+ (MCAdConfig *)createDataFlow {
    MCAdConfig *obj = [MCAdConfig new];
    obj.entityId = @"2390227";
    obj.cardBlow = 0;
    obj.duration = 3;
    obj.interval = 5;
    obj.loop = YES;
    obj.refer = @"Default";
    obj.skip = YES;
    obj.start = 1;
    obj.source = @"Default";
    return obj;
}

+ (MCAdConfig *)createPreConfig {
    MCAdConfig *obj = [MCAdConfig new];
    obj.entityId = @"4260942";
    obj.cardBlow = 0;
    obj.duration = 3;
    obj.interval = 5;
    obj.loop = YES;
    obj.refer = @"Default";
    obj.skip = YES;
    obj.start = 1;
    obj.source = @"Default";
    return obj;
}


+ (MCAdConfig *)createPauseConfig {
    MCAdConfig *obj = [MCAdConfig new];
    obj.entityId = @"4260939";
    obj.cardBlow = 0;
    obj.duration = 3;
    obj.interval = 5;
    obj.loop = YES;
    obj.refer = @"Default";
    obj.skip = YES;
    obj.start = 1;
    obj.source = @"Default";
    return obj;
}


@end



