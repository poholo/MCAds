//
//  MCNativeAdDto.m
//  MCAds
//
//  Created by majiancheng on 15/12/28.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//

#import "MCNativeAdDto.h"

#import <GDTAd/GDTAd.h>
#import <GDTAd/GDTNativeExpressAdView.h>

#import "MCInmobiDto.h"
#import "NSString+MCExtend.h"
#import "MCAdvertisementDto.h"
#import "MCFont.h"

@interface MCNativeAdDto ()

@property(nonatomic, strong) GDTNativeAdData *tencentAdData;
@property(nonatomic, strong) GDTNativeExpressAdView *tentcentExpressAdView;
@property(nonatomic, strong) BaiduMobAdNativeAdObject *baiduAdData;
@property(nonatomic, strong) MCInmobiDto *inmobiDto;
@property(nonatomic, strong) MCAdvertisementDto *customAdvertisementDto;

@end

@implementation MCNativeAdDto

- (instancetype)init {
    self = [super init];
    if (self) {
        self.entityId = [[NSUUID UUID] UUIDString];
        self.cacheSize = CGSizeZero;
    }

    return self;
}

- (NSString *)source {
    NSString *source = @"gdt";
    if (_baiduAdData) {
        source = @"baidu";
    } else if (_tencentAdData) {
        source = @"gdt";
    } else if (_inmobiDto) {
        source = @"inmmob";
    } else if (_customAdvertisementDto) {
        source = @"custom";
    }
    return source;
}


+ (MCNativeAdDto *)creatWithAdNative:(id)adNatvie {
    MCNativeAdDto *dto = [[MCNativeAdDto alloc] init];
    if ([adNatvie isKindOfClass:[BaiduMobAdNativeAdObject class]]) {
        BaiduMobAdNativeAdObject *adObject = adNatvie;
        adObject.presentAdViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        dto.baiduAdData = adObject;
        dto.text = adObject.text;
        dto.title = adObject.title;
        dto.iconImageURLString = adObject.iconImageURLString;
        dto.mainImageURLString = adObject.mainImageURLString;
        dto.morepics = adObject.morepics;
        dto.videoURLString = adObject.videoURLString;
        dto.videoDuration = adObject.videoDuration;
        dto.materialType = adObject.materialType;
    } else if ([adNatvie isKindOfClass:[GDTNativeAdData class]]) {
        GDTNativeAdData *adObject = adNatvie;
        dto.tencentAdData = adObject;
        dto.title = adObject.properties[GDTNativeAdDataKeyTitle];
        dto.text = adObject.properties[GDTNativeAdDataKeyDesc];
        dto.iconImageURLString = adObject.properties[GDTNativeAdDataKeyIconUrl];
        dto.mainImageURLString = adObject.properties[GDTNativeAdDataKeyImgUrl];
        dto.morepics = adObject.properties[GDTNativeAdDataKeyImgList];
//        dto.videoURLString = adObject.properties[];
//        dto.videoDuration = adObject.properties[];
        dto.materialType = NORMAL;
    } else if ([adNatvie isKindOfClass:[MCInmobiDto class]]) {
        MCInmobiDto *adObject = adNatvie;
        dto.baiduAdData = nil;
        dto.text = adObject.descriptiontext;
        dto.title = adObject.title;
        dto.iconImageURLString = adObject.iconURL;
        dto.mainImageURLString = adObject.screenshotsURL;
        dto.materialType = NORMAL;
    } else if ([adNatvie isKindOfClass:[MCAdvertisementDto class]]) {
        MCAdvertisementDto *advertisementDto = adNatvie;
        dto.customAdvertisementDto = advertisementDto;
        dto.text = advertisementDto.desc;
        dto.title = advertisementDto.title;
        dto.mainImageURLString = advertisementDto.imageUrl;
        dto.iconImageURLString = advertisementDto.iconUrl;
    } else if ([adNatvie isKindOfClass:[GDTNativeExpressAdView class]]) {
        GDTNativeExpressAdView *gdtNativeExpressAdView = (GDTNativeExpressAdView *) adNatvie;
        dto.tentcentExpressAdView = gdtNativeExpressAdView;

    }
    return dto;
}

- (BOOL)isExpired {
    return self.baiduAdData.isExpired;
}

- (CGSize)waterCellSize:(CGFloat)defaultWidth {
    if (CGSizeEqualToSize(CGSizeZero, self.cacheSize)) {
        CGSize titleSize = [self.text size4size:CGSizeMake(defaultWidth, 30) font:[MCFont fontIV]];
        if (titleSize.height > 30) {
            titleSize.height = 30;
        }
        titleSize.width = defaultWidth;
        CGSize waterSize = CGSizeMake(defaultWidth, defaultWidth * .75f + 60 + titleSize.height);
        return waterSize;
    } else {
        return _cacheSize;
    }
}

@end
