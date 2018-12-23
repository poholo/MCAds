//
// Created by majiancheng on 2017/6/2.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCDto.h"


typedef NS_ENUM(NSInteger, AdvertisementActionType) {
    AdvertisementActionDown = 1,
    AdvertisementActionOpenWeb
};

@interface MCAdvertisementDto : MCDto

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *desc;
@property(nonatomic, strong) NSString *imageUrl;
@property(nonatomic, assign) AdvertisementActionType action;
@property(nonatomic, strong) NSString *videoUrl;
@property(nonatomic, strong) NSString *url;
@property(nonatomic, strong) NSString *source;
@property(nonatomic, strong) NSString *packageName;
@property(nonatomic, strong) NSString *appName;
@property(nonatomic, strong) NSString *versionCode;
@property(nonatomic, assign) BOOL isDownloadTip;

@property(nonatomic, assign) NSInteger duration;

@property(nonatomic, copy) NSString *img;
@property(nonatomic, copy) NSString *link;

- (void)startActionVideoId:(NSString *)videoId adId:(NSString *)adId;

- (BOOL)isCanOpenSchema;

@end