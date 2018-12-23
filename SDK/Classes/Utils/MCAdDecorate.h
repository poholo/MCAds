//
//  MCAdDecorate.h
//  WaQuVideo
//
//  Created by littleplayer on 15/12/11.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCAdDef.h"
#import "MCAdJointDto.h"

extern NSString *const kAdJointKey;


@interface MCAdDecorate : NSObject

@property(nonatomic, readonly) MCAdStyleType styleId;

/***
 * 增加信息流广告
 * @param list 需要把整个信息流列表数据全部传进来
 * @param adJoint
 * @return 根据AdJoint增加广告
 */
- (NSMutableArray *)wrapAdsWithList:(NSArray *)list adJoint:(MCAdJointDto *)adJoint;

@end
