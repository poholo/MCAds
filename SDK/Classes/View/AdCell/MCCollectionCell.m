//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "MCCollectionCell.h"

#import "MCColor.h"

@implementation MCCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [MCColor colorV];
        self.backgroundView.backgroundColor = [MCColor colorV];
    }
    return self;
}

+ (NSString *)identifier {
    return NSStringFromClass(self.class);
}

+ (CGSize)size {
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds) / 2.0f;
    CGSize result = CGSizeMake(width, width);
    return result;
}

@end