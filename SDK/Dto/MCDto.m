//
// Created by majiancheng on 2018/12/18.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "MCDto.h"


@implementation MCDto

+ (id)createDto:(NSDictionary *)dictionary {
    MCDto *dto = [self new];
    [dto setValuesForKeysWithDictionary:dictionary];
    return dto;
}

- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.entityId = value;
    }
}

@end