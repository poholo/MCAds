//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "NSObject+AdApi.h"


@implementation NSObject (AdApi)

- (void)apiAdConfigMaterial:(void (^)(BOOL success, NSDictionary *dict))callBack {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdInfos_Baidu" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (callBack) {
        callBack(error ? NO : YES, dictionary);
    }
}

- (void)apiAdConfigMaterialSourceType:(MCAdSourceType)sourceType callBack:(void (^)(BOOL success, NSDictionary *dict))callBack {
    NSString *path = [self adSourceFileOfType:sourceType];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (callBack) {
        callBack(error ? NO : YES, dictionary);
    }
}

- (void)apiReqCustomAds:(NSInteger)num callBack:(void (^)(BOOL success, NSDictionary *))callBack {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DataFlow_Custom_Ads" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (callBack) {
        callBack(error ? NO : YES, dictionary);
    }
}

- (NSString *)adSourceFileOfType:(MCAdSourceType)sourceType {
    NSString *fileName = nil;
    switch (sourceType) {
        case MCAdSourceBaidu: {
            fileName = @"AdInfos_Baidu.json";
        }
            break;
        case MCAdSourceTencent: {
            fileName = @"AdInfos_GDT.json";
        }
            break;
        case MCAdSourceInmmobi: {
            fileName = @"AdInfos_Custom.json";
        }
            break;
        case MCAdSourceCustom: {
            fileName = @"AdInfos_Custom.json";
        }
            break;
    }
    return [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
}


@end
