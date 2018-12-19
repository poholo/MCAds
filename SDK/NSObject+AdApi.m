//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "NSObject+AdApi.h"


@implementation NSObject (AdApi)

- (void)apiAdConfigMaterial:(void (^)(BOOL success, NSDictionary *dict))callBack {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdInfos" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (callBack) {
        callBack(error ? NO : YES, dictionary);
    }
}

@end
