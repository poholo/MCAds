//
// Created by majiancheng on 17/2/10.
// Copyright (c) 2017 poholo. All rights reserved.
//

#import "MCLiveAdDto.h"


@implementation MCLiveAdDto

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    [super setValue:value forUndefinedKey:key];
    if ([key isEqualToString:@"adId"]) {
        self.entityId = value;
    } else if ([key isEqualToString:@"imgUrl"]) {
        self.picUrl = value;
    }
}


@end
