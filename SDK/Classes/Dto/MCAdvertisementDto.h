//
// Created by majiancheng on 2017/6/2.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCDto.h"


typedef NS_ENUM(NSInteger, MCAdvertisementActionType) {
    MCAdvertisementActionDown = 1,
    MCAdvertisementActionOpenWeb
};

@interface MCAdvertisementDto : MCDto

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *desc;
@property(nonatomic, strong) NSString *imageUrl;
@property(nonatomic, assign) MCAdvertisementActionType action;
@property(nonatomic, strong) NSString *videoUrl;
@property(nonatomic, strong) NSString *url; ///< 下载地址
@property(nonatomic, strong) NSString *source;
@property(nonatomic, strong) NSString *packageName; ///< app打开标识比如schema
@property(nonatomic, strong) NSString *appName;
@property(nonatomic, strong) NSString *versionCode;
@property(nonatomic, assign) BOOL isDownloadTip;

@property(nonatomic, assign) NSInteger duration;

@property(nonatomic, copy) NSString *img;
@property(nonatomic, copy) NSString *link;

@property(nonatomic, copy) NSString *iconUrl;

- (void)startAction;

- (BOOL)isCanOpenSchema;

@end
