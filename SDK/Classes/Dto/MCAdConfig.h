//
//  MCAdConfig.h
//  MCAds
//
//  Created by majiancheng on 15/12/17.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//

#import "MCDto.h"

#import "MCAdDef.h"
#import "MCAdBaseDelegate.h"


@interface MCAdConfig : MCDto

@property(nonatomic, copy) NSString *source;

@property(nonatomic, assign) BOOL cardBlow;

@property(nonatomic, assign) NSInteger start;

@property(nonatomic, assign) BOOL skip;

@property(nonatomic, assign) NSInteger duration;

@property(nonatomic, copy) NSString *refer;

@property(nonatomic, assign) BOOL loop;

@property(nonatomic, assign) NSInteger interval;

@property(nonatomic, readonly) MCAdSourceType adSourceType;

@property(nonatomic, strong) NSString *appId;

+ (MCAdConfig *)createDataFlow;

+ (MCAdConfig *)createPreConfig;

+ (MCAdConfig *)createPauseConfig;

+ (MCAdConfig *)createSplashDefault;

- (NSString *)adrefer:(NSString *)refer;

@end

