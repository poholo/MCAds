//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "MCCollectionCell.h"


@implementation MCCollectionCell

+ (NSString *)identifier {
    return NSStringFromClass(self.class);
}

+ (CGSize)size {
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds) / 2.0f;
    CGSize result = CGSizeMake(width, width);
    return result;
}

@end