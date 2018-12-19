//
//  MCPreVideoSSP.h
//  MCAds
//
//  Created by majiancheng on 2017/5/12.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MCAdDto;
@class MCAdConfig;
@protocol MobileAdServiceDelegate;

@interface MCPreVideoSSP : NSObject

+ (instancetype)sharedInstance;

- (void)updateAdConfig:(MCAdConfig *)adConfig;

- (void)requestAdsTarget:(id <MobileAdServiceDelegate>)delegate nums:(NSUInteger)numbs;;

- (NSString *)apId;

@end
