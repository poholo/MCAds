//
// Created by majiancheng on 2018/12/18.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MCDto : NSObject

@property(nonatomic, strong) NSString *entityId;

+ (id)createDto:(NSDictionary *)dictionary;

@end