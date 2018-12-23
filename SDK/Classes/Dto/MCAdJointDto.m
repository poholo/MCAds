//
// Created by majiancheng on 2017/5/23.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCAdJointDto.h"


@implementation MCAdJointDto {

}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.start = -1;
        self.interval = -1;
    }
    return self;
}

- (BOOL)avaliable {
    if (self.start >= 0 || self.interval > 0) {
        return YES;
    } else {
        return NO;
    }
}

@end
