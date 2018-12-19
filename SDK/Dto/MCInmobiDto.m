//
// Created by majiancheng on 16/6/29.
// Copyright (c) 2016 poholo. All rights reserved.
//

#import "MCInmobiDto.h"


@implementation MCInmobiDto

- (instancetype)init {
    self = [super init];
    if (self) {
        self.time = nil;
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    [super setValue:value forUndefinedKey:key];
    if ([key isEqualToString:@"description"]) {
        self.descriptiontext = value;
    }
    if ([key isEqualToString:@"icon"]) {
        self.iconURL = value[@"url"];
    }
    if ([key isEqualToString:@"screenshots"]) {
        self.screenshotsURL = value[@"url"];
    }
}

@end