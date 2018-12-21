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

- (void)apiAdConfigMaterialSourceType:(AdSourceType)sourceType callBack:(void (^)(BOOL success, NSDictionary *dict))callBack {
    NSString *path = [self adSourceFileOfType:sourceType];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (callBack) {
        callBack(error ? NO : YES, dictionary);
    }
}

- (NSString *)adSourceFileOfType:(AdSourceType)sourceType {
    NSString *fileName = nil;
    switch (sourceType) {
        case AdSourceBaidu: {
            fileName = @"AdInfos_Baidu.json";
        }
            break;
        case AdSourceTencent: {
            fileName = @"AdInfos_GDT.json";
        }
            break;
        case AdSourceInmmobi: {
            fileName = @"AdInfos_Self.json";
        }
            break;
    }
    return [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
}


@end
