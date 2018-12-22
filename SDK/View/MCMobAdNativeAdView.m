//
//  MCMobAdNativeAdView.m
//  MCAds
//
//  Created by poholo on 16/2/3.
//  Copyright © 2016年 poholo Inc. All rights reserved.
//

#import "MCMobAdNativeAdView.h"

#import "BaiduMobAdNativeVideoBaseView.h"

@interface MCMobAdNativeAdView ()

@property(nonatomic, weak) UIImageView *videoImageView;
@property(nonatomic, weak) UIView *videoControlView;
@property(nonatomic, weak) UIActivityIndicatorView *indicatorView;
@property(nonatomic, weak) UILabel *countDownLabel;
@property(nonatomic, weak) UIButton *actionButton;

@end

@implementation MCMobAdNativeAdView

- (void)refreshVideoFrame:(CGRect)frame {
    self.videoView.frame = frame;
    self.videoImageView.frame = self.videoView.bounds;
    self.videoControlView.frame = self.videoView.bounds;
    self.actionButton.center = self.videoImageView.center;
    self.indicatorView.center = self.videoImageView.center;
    CGRect countDownLabelFrame = self.countDownLabel.frame;
    self.countDownLabel.frame = CGRectMake(CGRectGetMaxX(self.videoView.frame) - CGRectGetWidth(countDownLabelFrame) - 10,
            5,
            CGRectGetWidth(countDownLabelFrame),
            CGRectGetHeight(countDownLabelFrame));
}

#pragma mark - getter

- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        for (UIView *view in self.videoControlView.subviews) {
            if ([view isKindOfClass:[UIActivityIndicatorView class]]) {
                __weak typeof(view) weakView = view;
                _indicatorView = (UIActivityIndicatorView *) weakView;
                break;
            }
        }
    }
    return _indicatorView;
}

- (UILabel *)countDownLabel {
    if (!_countDownLabel) {
        for (UIView *view in self.videoControlView.subviews) {
            if ([view isMemberOfClass:[UILabel class]]) {
                __weak typeof(view) weakView = view;
                _countDownLabel = (UILabel *) weakView;
                break;
            }
        }
    }
    return _countDownLabel;
}


- (UIButton *)actionButton {
    if (!_actionButton) {
        for (UIView *view in self.videoImageView.subviews) {
            if ([view isMemberOfClass:[UIButton class]]) {
                __weak typeof(view) weakView = view;
                _actionButton = (UIButton *) weakView;
                break;
            }
        }
    }
    return _actionButton;
}

- (UIImageView *)videoImageView {
    if (!_videoImageView) {
        for (UIView *view in self.videoView.subviews) {
            if ([view isMemberOfClass:[UIImageView class]]) {
                __weak typeof(view) weakView = view;
                _videoImageView = (UIImageView *) weakView;
                break;
            }
        }
    }
    return _videoImageView;
}


- (UIView *)videoControlView {
    if (!_videoControlView) {
        for (UIView *view in self.videoView.subviews) {
            if ([view isMemberOfClass:[UIView class]]) {
                __weak typeof(view) weakView = view;
                _videoControlView = weakView;
                break;
            }
        }
    }
    return _videoControlView;
}

@end
