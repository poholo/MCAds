//
// Created by majiancheng on 2017/5/24.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCAdBaseView.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <BaiduMobAdSDK/BaiduMobAdNativeVideoView.h>

#import "MCMobAdNativeAdView.h"
#import "MCAdsManager.h"
#import "MCAdDto.h"
#import "MCInmobiDto.h"
#import "MCMobileAdService.h"
#import "MCColor.h"
#import "MCFont.h"
#import "UIView+AdCorner.h"

@interface MCAdBaseView ()

@property(nonatomic, strong) MCMobAdNativeAdView *adBaiduView;
@property(nonatomic, strong) UIView *commenAdView;

@property(nonatomic, strong) MCAdDto *adDto;

@property(nonatomic, strong) UIImageView *picImageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *infoLabel;
@property(nonatomic, strong) UILabel *popularizeLabel;
@property(nonatomic, strong) UIImageView *logoView;
@property(nonatomic, strong) UIImageView *adImageView;
@property(nonatomic, strong) BaiduMobAdNativeVideoView *videoBaseView;

@end

@implementation MCAdBaseView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createAdview];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createAdview];
    }
    return self;
}

- (void)configureBaiduAd {
    if (!self.adBaiduView) {

        self.adBaiduView = [[MCMobAdNativeAdView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight(self.frame))
                                                            brandName:nil
                                                                title:self.infoLabel
                                                                 text:self.titleLabel
                                                                 icon:nil
                                                            mainImage:self.picImageView
                                                            videoView:self.videoBaseView];
        [self.videoBaseView play];
        self.adBaiduView.backgroundColor = [MCColor colorV];
        [self addSubview:self.adBaiduView];
        [self.adBaiduView addSubview:self.popularizeLabel];
        [self.adBaiduView addSubview:self.adImageView];
        [self.adBaiduView addSubview:self.logoView];
        [self.logoView sd_setImageWithURL:[NSURL URLWithString:@"https://cpro.baidustatic.com/cpro/ui/noexpire/img/2.0.1/bd-logo4.png"]];
        [self.adImageView sd_setImageWithURL:[NSURL URLWithString:@"https://cpro.baidustatic.com/cpro/ui/noexpire/img/mob_adicon.png"]];
    }

    self.videoBaseView = [[BaiduMobAdNativeVideoView alloc] initWithFrame:CGRectMake(0, 0, 300, 100) andObject:self.adDto.nativeAdDto];
    self.videoBaseView.backgroundColor = [MCColor redColor];

    [self.commenAdView addSubview:self.videoBaseView];
    [self.videoBaseView play];
}

- (void)configureCommenAd {
    [self addSubview:self.commenAdView];

    [self.commenAdView addSubview:self.picImageView];
    [self.commenAdView addSubview:self.popularizeLabel];
    [self.commenAdView addSubview:self.infoLabel];
    [self.commenAdView addSubview:self.titleLabel];
    [self.commenAdView addSubview:self.logoView];

    self.logoView.image = [UIImage imageNamed:@"ic_ad_gdt_logo"];
}

- (void)createAdview {
    //标题
    self.infoLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [MCColor colorII];
        label.font = [MCFont fontV];
        label.numberOfLines = 2;
        label;
    });

    //推广
    self.popularizeLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [MCColor colorIII];
        label.font = [MCFont fontIII];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"推广";
        [label addCorner:7 borderColor:[MCColor colorVI]];
        label;
    });

    //信息1
    self.titleLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [MCColor colorII];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [MCFont fontVI];
        label.numberOfLines = 2;
        label;
    });
    //图片
    self.picImageView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (CGRectGetHeight(self.frame) - 70) / 2, 140, 70)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView;
    });

    self.logoView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, CGRectGetHeight(self.frame) - 5 - 10, 10, 10)];
        imageView.userInteractionEnabled = NO;
        imageView;
    });

    self.adImageView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((CGFloat) (CGRectGetMaxX(self.picImageView.frame) - 5 - 12.5), CGRectGetHeight(self.picImageView.frame) - 5 - 7, 12.5, 7)];
        imageView.userInteractionEnabled = NO;
        imageView;
    });

    [self sendSubviewToBack:self.picImageView];
}

- (void)setAdModel:(MCAdDto *)mmAdDto {
    self.adDto = mmAdDto;
    switch (self.adDto.adSourceType) {
        case AdSourceBaidu: {
            [self configureBaiduAd];
            [self.adBaiduView loadAndDisplayNativeAdWithObject:self.adDto.nativeAdDto.baiduAdData completion:^(NSArray *errors) {
                MCLog(@"[AdSourceBaidu]%@", errors);
            }];

        }
            break;
        case AdSourceTencent: {
            [self configureCommenAd];
        }
            break;
        case AdSourceInmmobi : {
            [self configureCommenAd];
        }
            break;
        default: {
        }
            break;
    }

    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:self.adDto.nativeAdDto.mainImageURLString] placeholderImage:nil]; //[UIImage randomColorImage]
    self.infoLabel.text = self.adDto.nativeAdDto.title;
    self.titleLabel.text = self.adDto.nativeAdDto.text;

    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
}

- (void)setReferId:(NSString *)referId {
    _referId = referId;
    self.adBaiduView.referId = referId;
}

- (void)clickAd {
    switch (self.adDto.adSourceType) {
        case AdSourceBaidu: {

        }
            break;
        case AdSourceTencent: {
            [self.adDto.adService clickAd:self.adDto];
        }
            break;
        case AdSourceInmmobi: {
            if (self.adDto.nativeAdDto.inmobiDto && !self.adDto.nativeAdDto.inmobiDto.clicked) {
                NSArray *pingURL = self.adDto.nativeAdDto.inmobiDto.eventTracking[@"8"][@"urls"];
                for (NSString *url in pingURL) {
//                    [[MCAdsManager share] pingURL:url];
                    self.adDto.nativeAdDto.inmobiDto.clicked = YES;
                }
            }
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.adDto.nativeAdDto.inmobiDto.landingPage]];
        }
            break;
        default: {
        }
            break;
    }

    NSString *refer = [self.adDto adrefer:self.referId];
    //log
}

//发送展现日志
- (void)trackImpression {
    switch (self.adDto.adSourceType) {
        case AdSourceBaidu: {
//            if ([[NetConfig share] isAdTrackImpression]) {
            [self.adBaiduView trackImpression];
//            }
        }
            break;
        case AdSourceTencent: {
//            if ([[NetConfig share] isAdTrackImpression]) {
            [self.adDto.adService log2ThridPlatform:self.adDto attachView:self];
//            }
        }
            break;
        case AdSourceInmmobi : {
        }
            break;
        default: {
        }
            break;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.adBaiduView.frame = self.bounds;
    _commenAdView.frame = self.bounds;
}

#pragma mark - getter

- (UIView *)commenAdView {
    if (!_commenAdView) {
        _commenAdView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        _commenAdView.backgroundColor = [MCColor whiteColor];
        [_commenAdView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAd)]];
    }
    return _commenAdView;
}

@end
