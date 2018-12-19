//
// Created by majiancheng on 16/6/29.
// Copyright (c) 2016 poholo. All rights reserved.
//

#import "MCDto.h"


@interface MCInmobiDto : MCDto

@property(nonatomic, copy) NSString *pubContent;
@property(nonatomic, strong) NSDictionary *eventTracking;
@property(nonatomic, copy) NSString *landingPage;
@property(nonatomic, copy) NSString *beaconUrl;
@property(nonatomic, copy) NSString *requestId;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *descriptiontext;
@property(nonatomic, copy) NSString *iconURL;
@property(nonatomic, copy) NSString *screenshotsURL;
@property(nonatomic, copy) NSString *landingURL;
@property(nonatomic, assign) BOOL showed;
@property(nonatomic, assign) BOOL clicked;

@end