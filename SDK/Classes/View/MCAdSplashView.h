//
// Created by majiancheng on 2017/5/26.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MCSplashDto;
@class BaiduMobAdSplash;
@class MCAdPlayerView;
@class GDTSplashAd;

@protocol MCAdSplashViewDelegate <NSObject>

- (void)adSplashSuccessPresentScreen:(MCSplashDto *)dto;

- (void)adSplashViewJumpSplash:(MCSplashDto *)dto;

- (void)adSplashViewJumpContent:(MCSplashDto *)dto;

- (void)adSplashViewJumpResonEnd:(MCSplashDto *)dto;

- (void)adSplashViewJumpResonError:(MCSplashDto *)dto;

- (void)adSplashViewEnterbackGroundEnd:(MCSplashDto *)dto;

- (void)adSplashViewShowUsingPlayerKit:(MCSplashDto *)dto;

- (void)adSplashViewShowUsingWindow:(MCSplashDto *)dto;  //tencent

- (void)adSplashLifeTime:(NSUInteger)time;

@end


@interface MCAdSplashView : UIView

@property(nonatomic, weak) id <MCAdSplashViewDelegate> delegate;

@property(nonatomic, readonly) BaiduMobAdSplash *baiduMobAdSplash;

@property(nonatomic, readonly) GDTSplashAd *tencentMobAdSplash;

@property(nonatomic, readonly) MCAdPlayerView *adPlayerView;

- (void)loadData:(MCSplashDto *)dto;

- (void)updateJumpBtnInfo:(NSString *)jumpBtnInfo;

@end
