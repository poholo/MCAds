//
//  MCAdConfig.m
//  MCAds
//
//  Created by majiancheng on 15/12/17.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//

#import "MCAdConfig.h"

@implementation MCAdConfig
- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"] || [key isEqualToString:@"adid"] || [key isEqualToString:@"adId"]) {
        self.entityId = value;
    }
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

- (AdSourceType)adSourceType {
    NSString *source = self.source;
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

- (NSString *)appId {
    if (!_appId) {
        switch (self.adSourceType) {
            case AdSourceBaidu: {
                return @"e9f959d6";
            }
                break;
            case AdSourceTencent : {
                return @"1106180396";
            }
                break;
            case AdSourceInmmobi: {
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
    obj.styleId = AdDisplayStyleLittle;
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
    obj.styleId = AdDisplayStyleLittle;
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
    obj.styleId = AdDisplayStyleLittle;
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
    obj.styleId = AdDisplayStyleLittle;
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



