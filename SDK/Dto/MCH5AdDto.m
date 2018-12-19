//
// Created by majiancheng on 2017/7/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCH5AdDto.h"

#import "NSString+Extend.h"


@implementation MCH5AdDto
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    [super setValue:value forUndefinedKey:key];
    if ([key isEqualToString:@"adid"]) {
        self.entityId = value;
    }
}

- (CGSize)size {
    CGSize size = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) / 2.0f, CGRectGetWidth([UIScreen mainScreen].bounds) / 2.0f);
    CGFloat titleHight = [self.desc size4size:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) / 2 - 20, 100) font:[UIFont boldSystemFontOfSize:14]].height;
    titleHight = titleHight > 30 ? 30 : titleHight;
    CGFloat h = size.height + titleHight + 84 + 25;
    return CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) / 2.0f, h);
}

- (BOOL)isLive {
    return [self.targetTab isEqualToString:@"live"];
}
@end
