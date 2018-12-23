//
// Created by majiancheng on 2017/7/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MMH5AdDto.h"
#import "MCH5AdDto.h"


@implementation MMH5AdDto

- (NSString *)entityId {
    return self.dto.entityId;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.ct = MMH5Ad;
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"h5Ad"]) {
        self.dto = [MCH5AdDto createDto:value];
    }
}

- (CGSize)size {
    return [self.dto size];
}

@end