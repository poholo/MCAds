//
// Created by majiancheng on 16/4/16.
// Copyright (c) 2016 poholo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreGraphics/CoreGraphics.h>

#import "MCDto.h"

#import "MCAdDef.h"
#import "MCAdBaseDelegate.h"

@class MCNativeAdDto;
@class MCInmobiDto;
@class MCMobileAdService;


@interface MCAdDto : MCDto

@property(nonatomic, strong) MCNativeAdDto *nativeAdDto;

@property(nonatomic, assign) MCAdStyleType styleId;
@property(nonatomic, assign) MCAdSourceType adSourceType;

@property(nonatomic, copy) NSString *title;

@property(nonatomic, weak) MCMobileAdService *adService;

@property(nonatomic, assign) NSTimeInterval lastTimeInterval;

- (instancetype)initWithNativeAdDto:(id)dto styleId:(MCAdStyleType)styleId;

- (CGSize)waterCellSize:(CGFloat)defaultWidth;

- (NSString *)adrefer:(NSString *)refer;

- (BOOL)isExpired;

@end
