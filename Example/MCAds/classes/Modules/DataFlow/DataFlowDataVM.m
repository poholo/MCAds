//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "DataFlowDataVM.h"

#import "AdCateDto.h"
#import "VideoDto.h"
#import "MCAdDecorate.h"


@implementation DataFlowDataVM

- (void)reqDataFlow:(void (^)(BOOL success, NSMutableArray *dataList))callBack {
    NSString *path = [[NSBundle mainBundle] pathForResource:self.cateDto.file ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    for (NSDictionary *tmDict in dictionary[@"cards"]) {
        if ([tmDict[@"ct"] isEqualToString:@"v"]) {
            VideoDto *dto = [VideoDto createDto:tmDict[@"video"]];
            [self.dataList addObject:dto];
        }
    }

    self.dataList = [self.adDecorate wrapAdsWithList:self.dataList adJoint:[MCAdJointDto createDto:dictionary[kAdJointKey]]];

    if (callBack) {
        callBack(error ? NO : YES, self.dataList);
    }
}

@end