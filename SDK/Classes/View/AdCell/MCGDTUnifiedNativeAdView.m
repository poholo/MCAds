//
// Created by majiancheng on 2019/3/13.
// Copyright (c) 2019 majiancheng. All rights reserved.
//

#import "MCGDTUnifiedNativeAdView.h"
#import "MCAdUtils.h"


@interface MCGDTUnifiedNativeAdView ()

@property(nonatomic, strong) GDTLogoView *logoView;

@end

@implementation MCGDTUnifiedNativeAdView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createViews];
        [self addLayout];
    }
    return self;
}

- (void)createViews {
    [self addSubview:self.logoView];
}

- (void)addLayout {
    CGRect frame = self.logoView.frame;
    frame.origin.x = CGRectGetWidth(self.frame) - frame.size.width - 10;
    frame.origin.y = CGRectGetHeight(self.frame) - frame.size.height - 10;
    self.logoView.frame = frame;
}

- (void)loadData:(GDTUnifiedNativeAdDataObject *)unifiedNativeAdDataObject {
    [self registerDataObject:unifiedNativeAdDataObject logoView:self.logoView viewController:[MCAdUtils topController] clickableViews:@[self]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addLayout];
}

#pragma mark - getter

- (GDTLogoView *)logoView {
    if (!_logoView) {
        _logoView = [[GDTLogoView alloc] initWithFrame:CGRectMake(0, 0, kGDTLogoImageViewDefaultWidth, kGDTLogoImageViewDefaultHeight)];
    }
    return _logoView;
}


@end