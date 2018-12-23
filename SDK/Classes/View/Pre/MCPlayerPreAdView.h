//
// Created by majiancheng on 2017/5/11.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MCAdBaseView.h"
#import "MCAdBaseDelegate.h"

@class MCAdDto;

@protocol PlayerPreAdViewDelegate <NSObject>

- (void)playerStartUnionAd:(MCAdDto *)adDto;

- (void)playerEndUnionAd:(MCAdDto *)adDto;

- (void)playerUnionCountDown:(NSUInteger)secs;

- (void)playerFinishAllUnionAds;

@end

@interface MCPlayerPreAdView : MCAdBaseView <MCAdBaseDelegate>

@property(nonatomic, readonly) NSUInteger sumOfDuration;
@property(nonatomic, readonly) NSUInteger originSumOfDuraion;

@property(nonatomic, weak) id <PlayerPreAdViewDelegate> delegate;

- (void)updateBaiduAd:(NSArray<MCAdDto *> *)baiduAds perDuration:(NSUInteger)perDuration sumOfDuration:(NSUInteger)sumOfDuration;

- (void)playNext;

- (void)enable:(BOOL)enable;

@end