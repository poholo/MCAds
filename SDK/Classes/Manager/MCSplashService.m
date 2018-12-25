//
// Created by majiancheng on 16/6/29.
// Copyright (c) 2016 poholo. All rights reserved.
//

#import "MCSplashService.h"

#import <GDTAd/GDTAd.h>
#import <MCPlayerKit/PlayerKit.h>
#import <HWWeakTimer/HWWeakTimer.h>

#import "MCAdsManager.h"
#import "MCAdConfig.h"
#import "MCSplashDto.h"
#import "MCAdSplashView.h"
#import "MCAdvertisementDto.h"

@interface MCSplashService () <AdSplashViewDelegate>

@property(nonatomic, strong) UIWindow *window;
@property(nonatomic, strong) MCAdSplashView *adSplashView;
@property(nonatomic, strong) PlayerKit *playerKit;


@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign) NSInteger duration;
@property(nonatomic, strong) MCSplashDto *currentSplashDto;
@property(nonatomic, assign) NSTimeInterval resignActiveTimeInterval;

@end

@implementation MCSplashService

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.timer invalidate];
    self.timer = nil;
}

- (NSString *)publisherId {
    return [MCAdsManager share].splashConfig.appId;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self registerService];
    }
    return self;
}

- (void)showSplash {
    MCAdConfig *adconfig = [MCAdsManager share].splashConfig;
    if (!adconfig.entityId) {
        return;
    }
    [self resetEnv];
    [self showLoading];

    self.currentSplashDto = [MCSplashDto convertByAdConfig:[MCAdsManager share].splashConfig];
    [self show];
}

- (void)resetEnv {
    if ([MCAdsManager share].splashConfig.duration) {
        self.duration = [MCAdsManager share].splashConfig.duration;
    }
}

- (void)becomeActived {
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    if (self.resignActiveTimeInterval > 0 && timeInterval > self.resignActiveTimeInterval + 10 * 60) {
        [self showSplash];
    }
}

- (void)resignActive {
    self.resignActiveTimeInterval = [[NSDate date] timeIntervalSince1970];
}

- (void)registerService {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeActived) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resignActive) name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)showLoading {
    [self.window makeKeyAndVisible];
    [self.window addSubview:self.adSplashView];
}

- (void)show {
    MCLog(@"[SPlashManager]show");
    [self.adSplashView loadData:self.currentSplashDto];
    if (self.currentSplashDto.splashType == MCSplashTypeCustomImage
            || self.currentSplashDto.splashType == MCSplashTypeCustomVideo) {
        [self timer];
    }
}

- (void)hide {
    [_adSplashView removeFromSuperview];
    _adSplashView = nil;
    if (_window) {
        [_window resignKeyWindow];
        _window = nil;
    }
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
    }
    if (_playerKit) {
        [_playerKit destoryPlayer];
        _playerKit = nil;
    }


    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow makeKeyAndVisible];
}


#pragma mark - AdSplashViewDelegate

- (void)adSplashViewJumpSplash:(MCSplashDto *)dto {
    switch (dto.splashType) {
        case MCSplashTypeBaidu: {
//            [LogService createSkipAD:[[[LogParam createWithRefer:@"plaunch_splash"] playedDate:[NSString stringWithFormat:@"%ld", (long) (SplashDefaultTime - self.duration) * 1000]] advertisment:[MCAdsManager share].splashConfig.entityId]];
        }
            break;
        case MCSplashTypeCustomImage: {
//            [LogService createSkipAD:[[[LogParam createWithRefer:@"plaunch_splash"] playedDate:[NSString stringWithFormat:@"%ld", (long) (SplashDefaultTime - self.duration) * 1000]] advertisment:dto.entityId]];
        }
            break;
        case MCSplashTypeCustomVideo: {
//            [LogService createSkipAD:[[[LogParam createWithRefer:@"plaunch_vad"] playedDate:[NSString stringWithFormat:@"%ld", (long) (SplashDefaultTime - self.duration) * 1000]] advertisment:dto.entityId]];
        }
            break;
        case MCSplashTypeTencent: {
//            [LogService createSkipAD:[[[LogParam createWithRefer:@"plaunch_gdt"] playedDate:[NSString stringWithFormat:@"%ld", (long) (SplashDefaultTime - self.duration) * 1000]] advertisment:[MCAdsManager share].splashConfig.entityId]];
        }
            break;
        default: {
        }
            break;
    }
    [self hide];
}

- (void)adSplashViewJumpContent:(MCSplashDto *)dto {
    MCAdConfig *currentConfig = [MCAdsManager share].splashConfig;
    switch (dto.splashType) {
        case MCSplashTypeBaidu: {
//            [LogService createClickAD:[[[[[[LogParam createWithRefer:[currentConfig adrefer:REFER_VIEW_LUNCH]] changeEventType:@"0"] advertisment:currentConfig.entityId] searchPostion:0] time:[NSString stringWithFormat:@"%@", self.currentSplashDto.resq]] advertismentPic:@(MCAdStyleLittle)]];
            [self hide];
        }
            break;
        case MCSplashTypeCustomImage: {
            [self.currentSplashDto.advertisementDto startAction];
            [self hide];
        }
            break;
        case MCSplashTypeCustomVideo: {
            [self.currentSplashDto.advertisementDto startAction];
            [self hide];
        }
            break;
        case MCSplashTypeTencent: {
//            [LogService createClickAD:[[[[[[LogParam createWithRefer:[currentConfig adrefer:REFER_VIEW_LUNCH]] changeEventType:@"0"] advertisment:currentConfig.entityId] searchPostion:0] time:[NSString stringWithFormat:@"%@", self.currentSplashDto.resq]] advertismentPic:@(MCAdStyleLittle)]];
        }
            break;
        default: {
        }
            break;
    }
}

- (void)adSplashViewJumpResonEnd:(MCSplashDto *)dto {
    switch (dto.splashType) {
        case MCSplashTypeBaidu: {

        }
            break;
        case MCSplashTypeCustomImage: {

        }
            break;
        case MCSplashTypeCustomVideo: {

        }
            break;
        case MCSplashTypeTencent: {

        }
            break;
        default: {
        }
            break;
    }
    [self hide];
}

- (void)adSplashViewJumpResonError:(MCSplashDto *)dto {
    switch (dto.splashType) {
        case MCSplashTypeBaidu: {
            [self resetEnv];
        }
            break;
        case MCSplashTypeCustomImage: {
            [self resetEnv];
        }
            break;
        case MCSplashTypeCustomVideo: {
            [self resetEnv];
        }
            break;
        case MCSplashTypeTencent: {
            [self resetEnv];
        }
            break;
        default: {
        }
            break;
    }
    [self hide];
}

- (void)adSplashViewEnterbackGroundEnd:(MCSplashDto *)dto {
    switch (dto.splashType) {
        case MCSplashTypeBaidu: {
        }
            break;
        case MCSplashTypeCustomImage: {

        }
            break;
        case MCSplashTypeCustomVideo: {

        }
            break;
        case MCSplashTypeTencent: {

        }
            break;
        default: {
        }
            break;
    }
    [self hide];
}

- (void)adSplashViewShowUsingPlayerKit:(MCSplashDto *)dto {
    switch (dto.splashType) {
        case MCSplashTypeBaidu: {

        }
            break;
        case MCSplashTypeCustomImage: {

        }
            break;
        case MCSplashTypeCustomVideo: {
            if (dto.advertisementDto.videoUrl) {
                [self.playerKit playUrls:@[dto.advertisementDto.videoUrl]];
            } else {
                if (dto.advertisementDto.imageUrl) {
                    MCLog(@"Splash Image");
                } else {
                    MCLog(@"Error:::: url = NULL");
                }
            }
        }
            break;
        case MCSplashTypeTencent: {

        }
            break;
        default: {
        }
            break;
    }
}

- (void)adSplashViewShowUsingWindow:(MCSplashDto *)dto {
    switch (dto.splashType) {
        case MCSplashTypeBaidu: {

        }
            break;
        case MCSplashTypeCustomImage: {

        }
            break;
        case MCSplashTypeCustomVideo: {

        }
            break;
        case MCSplashTypeTencent: {
            [self.adSplashView.tencentMobAdSplash loadAdAndShowInWindow:self.window];
            [self.window sendSubviewToBack:self.adSplashView];
        }
            break;
        default: {
        }
            break;
    }
}

- (void)adSplashSuccessPresentScreen:(MCSplashDto *)dto {
    MCAdConfig *currentConfig = [MCAdsManager share].splashConfig;
//    LogParam *logParam = [[[LogParam createWithRefer:[currentConfig adrefer:REFER_VIEW_LUNCH]] advertisment:currentConfig.entityId] time:[NSString stringWithFormat:@"%@", self.currentSplashDto.resq]];
//    [LogService createShowAD:logParam];
    switch (dto.splashType) {
        case MCSplashTypeBaidu: {
//            [self hide];
        }
            break;
        case MCSplashTypeCustomImage: {

        }
            break;
        case MCSplashTypeCustomVideo: {

        }
            break;
        case MCSplashTypeTencent: {
        }
            break;
        default: {
        }
            break;
    }
}

- (void)adSplashLifeTime:(NSUInteger)time {

}

#pragma mark - getter

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.windowLevel = UIWindowLevelAlert;
        _window.rootViewController = [UIViewController new];
    }
    return _window;
}

- (MCAdSplashView *)adSplashView {
    if (!_adSplashView) {
        _adSplashView = [[MCAdSplashView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.adSplashView updateJumpBtnInfo:[self jumpBtnStr]];
        _adSplashView.delegate = self;
    }
    return _adSplashView;
}

- (NSTimer *)timer {
    if (!_timer) {
        __weak typeof(self) weakSelf = self;
        _timer = [HWWeakTimer scheduledTimerWithTimeInterval:1 block:^(id userInfo) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.duration--;
            [strongSelf.adSplashView updateJumpBtnInfo:[strongSelf jumpBtnStr]];
            if (strongSelf.duration <= 0) {
                [strongSelf adSplashViewJumpResonEnd:strongSelf.currentSplashDto];
            }
        }                                           userInfo:nil repeats:YES];
    }
    return _timer;
}

- (PlayerKit *)playerKit {
    if (!_playerKit) {
        _playerKit = [[PlayerKit alloc] initWithPlayerView:(PlayerBaseView <PlayerViewDelegate> *) self.adSplashView.adPlayerView];
        _playerKit.playerCoreType = PlayerCoreAVPlayer;
        _playerKit.actionAtItemEnd = PlayerActionAtItemEndCircle;
    }
    return _playerKit;
}

- (NSString *)jumpBtnStr {
    if (![MCAdsManager share].splashConfig.skip) {
        return [NSString stringWithFormat:@"推广 | 剩余 %zd秒", self.duration];
    } else {
        return [NSString stringWithFormat:@"跳过广告 %zd秒", self.duration];
    }

}


@end
