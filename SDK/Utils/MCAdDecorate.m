//
//  MCAdDecorate.m
//  WaQuVideo
//
//  Created by littleplayer on 15/12/11.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//



#import "MCAdDecorate.h"

#import "MCAdJointDto.h"
#import "MCAdsManager.h"
#import "MCMobileAdService.h"
#import "MCAdDto.h"

NSString *const kAdJointKey = @"flowPage";

@interface MCAdDecorate ()

@property(nonatomic, strong) MCAdJointDto *adJointDto;

@end

@implementation MCAdDecorate
- (MCAdStyleType)styleId {
    return self.adJointDto.styleId;
}

- (void)refresh {
    self.adJointDto = nil;
}

- (NSMutableArray *)wrapAdsWithList:(NSArray *)list adJoint:(MCAdJointDto *)adJoint {
    if ([MCAdsManager share].flowAdService.adConfig == nil || ![adJoint avaliable]) {
        return [NSMutableArray arrayWithArray:list];
    }
    if (!self.adJointDto) {
        self.adJointDto = adJoint;
        if (list.count > 0) {
            NSObject *obj = [list firstObject];
//            if ([obj isKindOfClass:[MMOpDto class]] || [obj isKindOfClass:[OpDto class]]) {
//                self.adJointDto.start++;
//            }
        }
        self.adJointDto.cursor = adJoint.start;
    }
    NSMutableArray *destArray = [[NSMutableArray alloc] initWithCapacity:list.count];
    __weak typeof(self) weakSelf = self;
    [list enumerateObjectsUsingBlock:^(NSObject *dto, NSUInteger idx, BOOL *stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf.adJointDto.loop && strongSelf.adJointDto.cursor > strongSelf.adJointDto.start) {
            [destArray addObject:dto];
        } else {
            if (idx < strongSelf.adJointDto.cursor) {
                [destArray addObject:dto];
            } else if (idx == strongSelf.adJointDto.cursor) {
                if ([strongSelf jumpPosition:dto]) {
                    strongSelf.adJointDto.cursor++;
                    [destArray addObject:dto];
                } else {
                    MCAdDto *adDto = [[MCAdsManager share].flowAdService takeOneAd];
                    if (adDto) {
                        adDto.styleType = self.adJointDto.styleId;
                        adDto.materialType = self.adJointDto.materialType;
                        [destArray addObject:adDto];
                    }
                    strongSelf.adJointDto.cursor += strongSelf.adJointDto.interval;
                    [destArray addObject:dto];
                }
            } else {
                [destArray addObject:dto];
            }
        }
    }];
    [self refreshAdJointCursorWhenEndCircle:destArray];
    return destArray;
}

- (BOOL)jumpPosition:(NSObject *)dto {
//    return [dto isKindOfClass:[MMOpDto class]] || [dto isKindOfClass:[OpDto class]];
    return NO;
}

- (void)refreshAdJointCursorWhenEndCircle:(NSArray *)destArray {
    __weak typeof(self) weakSelf = self;
    [destArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSObject *dto, NSUInteger idx, BOOL *stop) {
        if ([dto isKindOfClass:[MCAdDto class]]) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.adJointDto.cursor = idx + strongSelf.adJointDto.interval;
            *stop = YES;
        }
    }];
}


@end
