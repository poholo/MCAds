//
// Created by majiancheng on 2017/5/11.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCPlayerPreAdView.h"

#import <BaiduMobAdSDK/BaiduMobAdNativeAdView.h>


#import "MCAdDto.h"
#import "MCAdsManager.h"
#import "HWWeakTimer.h"
#import "UIView+AdCorner.h"
#import "MCColor.h"

@interface MCPlayerPreAdView ()

@property(nonatomic, strong) NSArray<MCAdDto *> *adDtos;
@property(nonatomic, assign) NSUInteger index;

@property(nonatomic, assign) NSUInteger perDuration;
@property(nonatomic, assign) NSUInteger originSumOfDuraion;
@property(nonatomic, assign) NSUInteger perAnimateTime;
@property(nonatomic, assign) NSUInteger sumOfDuration;
@property(nonatomic, strong) NSTimer *timer;

@end

@implementation MCPlayerPreAdView

- (void)dealloc {
    [self fireTimer];
}

- (void)fireTimer {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (NSTimer *)timer {
    if (_timer == nil) {
        __weak typeof(self) weakSelf = self;
        _timer = [HWWeakTimer scheduledTimerWithTimeInterval:1 block:^(id userInfo) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.sumOfDuration--;
            if (strongSelf.perDuration <= strongSelf.perAnimateTime + 1) {
                strongSelf.perAnimateTime = 0;
                [strongSelf playNext];
            } else {
                strongSelf.perAnimateTime++;
            }
            if ([strongSelf.delegate respondsToSelector:@selector(playerUnionCountDown:)]) {
                [strongSelf.delegate playerUnionCountDown:(strongSelf.sumOfDuration > 0 ? strongSelf.sumOfDuration : 1)];
            }
        }                                           userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    }
    return _timer;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = self.bounds;
    CGSize size = self.logoView.frame.size;

    self.titleLabel.frame = CGRectMake(15, frame.size.height - 34, frame.size.width - 30, 13);
    self.popularizeLabel.frame = CGRectMake(frame.size.width - 30, frame.size.height - 10 - size.height, 30, 10);
    self.popularizeLabel.backgroundColor = [MCColor clearColor];
    self.infoLabel.frame = CGRectMake(15, frame.size.height - 16, frame.size.width - 30, 15);
    self.logoView.frame = CGRectMake(frame.size.width - size.width, frame.size.height - size.height, size.width, size.height);
    self.picImageView.frame = frame;
    [self updateStyle];
}


- (void)updateBaiduAd:(NSArray<MCAdDto *> *)baiduAds perDuration:(NSUInteger)perDuration sumOfDuration:(NSUInteger)sumOfDuration {
    self.perDuration = perDuration;
    self.sumOfDuration = sumOfDuration;
    self.originSumOfDuraion = sumOfDuration;
    _adDtos = baiduAds;
    self.index = 0;
    [self playNext];
    [self fireTimer];

    if ([self.delegate respondsToSelector:@selector(playerFinishAllUnionAds)]) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self.delegate selector:@selector(playerFinishAllUnionAds) object:nil];
        [self.delegate playerFinishAllUnionAds];
    }

    if ([self.delegate respondsToSelector:@selector(playerUnionCountDown:)]) {
        [self.delegate playerUnionCountDown:self.sumOfDuration];
    }
    [self timer];
}

- (void)updateStyle {
    self.titleLabel.textColor = [MCColor colorII];
    self.infoLabel.textColor = [MCColor colorII];
    [self.popularizeLabel addCorner:5];
}

- (void)playNext {
    if (self.index >= self.adDtos.count) {
        return;
    }
    if (self.index > 0) {
        MCAdDto *adDto = self.adDtos[self.index - 1];
        if ([self.delegate respondsToSelector:@selector(playerEndUnionAd:)]) {
            [self.delegate playerEndUnionAd:adDto];
        }
    }
    MCAdDto *adDto = self.adDtos[self.index];
    if ([self.delegate respondsToSelector:@selector(playerStartUnionAd:)]) {
        [self.delegate playerStartUnionAd:adDto];
    }

    [self setAdModel:adDto];
    [self trackImpression];

    self.index++;
}

- (void)enable:(BOOL)enable {
    if (enable) {
        [self fireTimer];
        if ([self.delegate respondsToSelector:@selector(playerFinishAllUnionAds)]) {
            [NSObject cancelPreviousPerformRequestsWithTarget:self.delegate selector:@selector(playerFinishAllUnionAds) object:nil];
            [self.delegate playerFinishAllUnionAds];
        }

        if ([self.delegate respondsToSelector:@selector(playerUnionCountDown:)]) {
            [self.delegate playerUnionCountDown:self.sumOfDuration];
        }
        [self timer];
    } else {
        [self fireTimer];
    }
}

#pragma mark - AdBaseDelegate

- (NSString *)apId {
    return [[MCAdsManager share] apIdAdType:MCAdCategoryDataPre];
}


- (void)setAdPostion:(NSIndexPath *)indexPath {

}

- (void)setAdType:(NSString *)adType {
}

- (void)setAdPicType:(MCAdStyleType)picType {

}

- (void)setAdRefer:(NSString *)refreId {
    self.referId = refreId;
}

@end
