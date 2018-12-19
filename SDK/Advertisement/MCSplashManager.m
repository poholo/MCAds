//
// Created by majiancheng on 16/6/29.
// Copyright (c) 2016 poholo. All rights reserved.
//

#import "MCSplashManager.h"

#import <GDTAd/GDTAd.h>
#import <MCPlayerKit/PlayerKit.h>
#import <HWWeakTimer/HWWeakTimer.h>

#import "MCMobileSSP.h"
#import "MCAdConfig.h"
#import "MCLiveAdDto.h"
#import "MCSplashDto.h"
#import "MCAdSplashView.h"
#import "AppDelegate.h"
#import "MCAdvertisementDto.h"

#define SplashDefaultTime 10

@interface MCSplashManager () <AdSplashViewDelegate>

@property(nonatomic, strong) UIWindow *window;
@property(nonatomic, strong) MCAdSplashView *adSplashView;
@property(nonatomic, strong) PlayerKit *playerKit;


@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign) NSInteger duration;
@property(nonatomic, strong) MCSplashDto *currentSplashDto;
@property(nonatomic, assign) long long backgroundTime;

@end

@implementation MCSplashManager

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}

+ (void)load {
    [self shareInstance];
}

+ (instancetype)shareInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSString *)publisherId {
    return [MCMobileSSP sharedInstance].splashConfig.appId;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //app进入后台时,请求广告
//        @weakify(self);
//        [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil] subscribeNext:^(id x) {
//            @strongify(self);
//            long long int homeLastTime = [NSDate llmSec];
//            self.backgroundTime = homeLastTime;
//            [[NSUserDefaults standardUserDefaults] setObject:@(homeLastTime) forKey:HOME_LAST_TIME];
//        }];
//
//        //后台进入,再次展示广告
//        [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationWillEnterForegroundNotification object:nil] subscribeNext:^(id x) {
//            @strongify(self);
//            if (self.backgroundTime > 0 && [NSDate llmSec] > self.backgroundTime + SplashDefaultTime * 60 * 1000) {
//                [self showSplash];
//            }
//        }];
    }
    return self;
}

- (void)showSplash {
    MCAdConfig *adconfig = [MCMobileSSP sharedInstance].splashConfig;
    if (!adconfig.entityId && ![adconfig.source isEqualToString:@"waqu"]) {
        return;
    }
    [self resetEnv];
    [self showLoading];

    if ([[MCMobileSSP sharedInstance].splashConfig.source isEqualToString:@"waqu"]) {
        [self loadWaquAd];
    } else {
        self.currentSplashDto = [MCSplashDto convertByAdConfig:[MCMobileSSP sharedInstance].splashConfig];
        [self show];
    }
}

- (void)resetEnv {
    if ([MCMobileSSP sharedInstance].splashConfig.duration) {
        self.duration = [MCMobileSSP sharedInstance].splashConfig.duration;
    } else {
        self.duration = SplashDefaultTime;
    }

}

- (void)loadWaquAd {
//    RACSignal *racSignal = [self getLiveAd];
//    @weakify(self);
//    [racSignal subscribeNext:^(NSDictionary *result) {
//        @strongify(self);
//        self.currentSplashDto = [MCSplashDto createDto:result];
//        self.currentSplashDto.source = [MCMobileSSP sharedInstance].splashConfig.source;
//        [self show];
//    }                  error:^(NSError *error) {
//        @strongify(self);
//        [self hide];
//    }];
}

- (void)showLoading {
    [self.window makeKeyAndVisible];
    [self.window addSubview:self.adSplashView];
}

- (void)show {
    MCLog(@"[SPlashManager]show");
    [self.adSplashView loadData:self.currentSplashDto];
    if (self.currentSplashDto.splashType != SPlashTypeTencent) {
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

    AppDelegate *delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    UIWindow *keyWindow = delegate.window;
    [keyWindow makeKeyAndVisible];
}


#pragma mark - AdSplashViewDelegate

- (void)adSplashViewJumpSplash:(MCSplashDto *)dto {
    switch (dto.splashType) {
        case SplashTypeBaidu: {
//            [LogService createSkipAD:[[[LogParam createWithRefer:@"plaunch_splash"] playedDate:[NSString stringWithFormat:@"%ld", (long) (SplashDefaultTime - self.duration) * 1000]] advertisment:[MCMobileSSP sharedInstance].splashConfig.entityId]];
        }
            break;
        case SplashTypeWaQuImage: {
//            [LogService createSkipAD:[[[LogParam createWithRefer:@"plaunch_splash"] playedDate:[NSString stringWithFormat:@"%ld", (long) (SplashDefaultTime - self.duration) * 1000]] advertisment:dto.entityId]];
        }
            break;
        case SplashTypeWaQuVideo: {
//            [LogService createSkipAD:[[[LogParam createWithRefer:@"plaunch_vad"] playedDate:[NSString stringWithFormat:@"%ld", (long) (SplashDefaultTime - self.duration) * 1000]] advertisment:dto.entityId]];
        }
            break;
        case SPlashTypeTencent: {
//            [LogService createSkipAD:[[[LogParam createWithRefer:@"plaunch_gdt"] playedDate:[NSString stringWithFormat:@"%ld", (long) (SplashDefaultTime - self.duration) * 1000]] advertisment:[MCMobileSSP sharedInstance].splashConfig.entityId]];
        }
            break;
        default: {
        }
            break;
    }
    [self hide];
}

- (void)adSplashViewJumpContent:(MCSplashDto *)dto {
    MCAdConfig *currentConfig = [MCMobileSSP sharedInstance].splashConfig;
    switch (dto.splashType) {
        case SplashTypeBaidu: {
//            [LogService createClickAD:[[[[[[LogParam createWithRefer:[currentConfig adrefer:REFER_VIEW_LUNCH]] changeEventType:@"0"] advertisment:currentConfig.entityId] searchPostion:0] time:[NSString stringWithFormat:@"%@", self.currentSplashDto.resq]] advertismentPic:@(AdDisplayStyleLittle)]];
            [self hide];
        }
            break;
        case SplashTypeWaQuImage: {
            //TODO::
            [self hide];
        }
            break;
        case SplashTypeWaQuVideo: {
//            [LogService createClickAD:[[[[[[LogParam createWithRefer:[currentConfig adrefer:@"plaunch"]] changeEventType:@"0"] advertisment:dto.entityId] searchPostion:0] time:[NSString stringWithFormat:@"%@", dto.resq]] advertismentPic:@(AdDisplayStyleBig)]];
//            [dto.advertisementDto startAction:self.logADService logParam:nil videoId:nil adId:dto.entityId];
            [self hide];
        }
            break;
        case SPlashTypeTencent: {
//            [LogService createClickAD:[[[[[[LogParam createWithRefer:[currentConfig adrefer:REFER_VIEW_LUNCH]] changeEventType:@"0"] advertisment:currentConfig.entityId] searchPostion:0] time:[NSString stringWithFormat:@"%@", self.currentSplashDto.resq]] advertismentPic:@(AdDisplayStyleLittle)]];
        }
            break;
        default: {
        }
            break;
    }
}

- (void)adSplashViewJumpResonEnd:(MCSplashDto *)dto {
    switch (dto.splashType) {
        case SplashTypeBaidu: {

        }
            break;
        case SplashTypeWaQuImage: {

        }
            break;
        case SplashTypeWaQuVideo: {

        }
            break;
        case SPlashTypeTencent: {

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
        case SplashTypeBaidu: {
            [self resetEnv];
            [self loadWaquAd];
        }
            break;
        case SplashTypeWaQuImage: {

        }
            break;
        case SplashTypeWaQuVideo: {

        }
            break;
        case SPlashTypeTencent: {
            [self resetEnv];
            [self loadWaquAd];
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
        case SplashTypeBaidu: {
        }
            break;
        case SplashTypeWaQuImage: {

        }
            break;
        case SplashTypeWaQuVideo: {

        }
            break;
        case SPlashTypeTencent: {

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
        case SplashTypeBaidu: {

        }
            break;
        case SplashTypeWaQuImage: {

        }
            break;
        case SplashTypeWaQuVideo: {
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
        case SPlashTypeTencent: {

        }
            break;
        default: {
        }
            break;
    }
}

- (void)adSplashViewShowUsingWindow:(MCSplashDto *)dto {
    switch (dto.splashType) {
        case SplashTypeBaidu: {

        }
            break;
        case SplashTypeWaQuImage: {

        }
            break;
        case SplashTypeWaQuVideo: {

        }
            break;
        case SPlashTypeTencent: {
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
    MCAdConfig *currentConfig = [MCMobileSSP sharedInstance].splashConfig;
//    LogParam *logParam = [[[LogParam createWithRefer:[currentConfig adrefer:REFER_VIEW_LUNCH]] advertisment:currentConfig.entityId] time:[NSString stringWithFormat:@"%@", self.currentSplashDto.resq]];
//    [LogService createShowAD:logParam];
    switch (dto.splashType) {
        case SplashTypeBaidu: {
            [self hide];
        }
            break;
        case SplashTypeWaQuImage: {

        }
            break;
        case SplashTypeWaQuVideo: {

        }
            break;
        case SPlashTypeTencent: {
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
        _playerKit = [[PlayerKit alloc] initWithPlayerView:self.adSplashView.adPlayerView];
        _playerKit.playerCoreType = PlayerCoreIJKPlayer;
        _playerKit.actionAtItemEnd = PlayerActionAtItemEndCircle;
    }
    return _playerKit;
}

- (NSString *)jumpBtnStr {
    if (![MCMobileSSP sharedInstance].splashConfig.skip) {
        return [NSString stringWithFormat:@"推广 | 剩余 %zd秒", self.duration];
    } else {
        return [NSString stringWithFormat:@"跳过广告 %zd秒", self.duration];
    }

}


@end
