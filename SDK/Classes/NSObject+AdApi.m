//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "NSObject+AdApi.h"

#import "MCAdsManager.h"
#import "MCApiConfig.h"


@implementation NSObject (AdApi)

- (void)apiAdConfigMaterial:(void (^)(BOOL success, NSDictionary *dict))callBack {
    if ([MCAdsManager share].apiConfig.apiAdConfigMaterialCallBack) {
        NSDictionary *dictionary = [MCAdsManager share].apiConfig.apiAdConfigMaterialCallBack();
        BOOL success = [dictionary[DATA_SUCCESS] boolValue];
        NSDictionary *dataDict = dictionary[DATA_DICT];
        if (callBack) {
            callBack(success, dataDict);
        }
    } else {
        NSAssert([MCAdsManager share].apiConfig.apiAdConfigMaterialCallBack, @"[Api]apiAdConfigMaterial unimplement");
    }
}

- (void)apiAdConfigMaterialSourceType:(MCAdSourceType)sourceType callBack:(void (^)(BOOL success, NSDictionary *dict))callBack {
    if ([MCAdsManager share].apiConfig.apiAdConfigMaterialSourceTypeCallBack) {
        NSDictionary *dictionary = [MCAdsManager share].apiConfig.apiAdConfigMaterialSourceTypeCallBack(sourceType);
        BOOL success = [dictionary[DATA_SUCCESS] boolValue];
        NSDictionary *dataDict = dictionary[DATA_DICT];
        if (callBack) {
            callBack(success, dataDict);
        }
    } else {
        NSAssert([MCAdsManager share].apiConfig.apiAdConfigMaterialCallBack, @"[Api]apiAdConfigMaterialSourceType unimplement");
    }
}

- (void)apiReqCustomAds:(NSInteger)num callBack:(void (^)(BOOL success, NSDictionary *))callBack {
    if ([MCAdsManager share].apiConfig.apiReqCustomAdsCallBack) {
        NSDictionary *dictionary = [MCAdsManager share].apiConfig.apiReqCustomAdsCallBack(num);
        BOOL success = [dictionary[DATA_SUCCESS] boolValue];
        NSDictionary *dataDict = dictionary[DATA_DICT];
        if (callBack) {
            callBack(success, dataDict);
        }
    } else {
        NSAssert([MCAdsManager share].apiConfig.apiAdConfigMaterialCallBack, @"[Api]apiReqCustomAds unimplement");
    }
}


@end
