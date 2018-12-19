//
// Created by majiancheng on 2017/5/23.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCAdDef.h"

@class MCAdBaseCell;
@class MCAdCollectionBaseCell;
@class MCAdDto;
@class UIScrollView;
@class MCDto;
@class MCTapTableCell;


@interface NSObject (Ad)
/***
 * 注册广告通用cell
 * @param container
 */
- (void)registerCommenAdCell:(UIScrollView *)container;

/**
 * 广告通用取高度
 * @param type
 * @return
 */
- (CGFloat)adSuiltHeight:(AdDisplayStyleType)type;

/**
 *TableView 广告通用cell包含日志上报
 * @param type  广告样式
 * @param container 容器
 * @param indexPath
 * @param adDto 广告
 * @param logADService 日志服务
 * @return
 */
- (MCAdBaseCell *)adSuiltCell:(AdDisplayStyleType)type
                    container:(UIScrollView *)container
                    indexPath:(NSIndexPath *)indexPath
                        adDto:(MCAdDto *)adDto
                        refer:(NSString *)refer;

/**
 * CollectionView广告通用取size
 * @param type
 * @return
 */
- (CGSize)adCollectionViewSuiltHeight:(AdDisplayStyleType)type;

/**
 * CollectionView广告通用cell包含日志上报
 * @param type  广告样式
 * @param container 容器
 * @param indexPath
 * @param adDto 广告
 * @param logADService 日志服务
 * @return
 */
- (MCAdCollectionBaseCell *)adSuiltCollectionViewCell:(AdDisplayStyleType)type
                                            container:(UIScrollView *)container
                                            indexPath:(NSIndexPath *)indexPath
                                                adDto:(MCDto *)adDto
                                                refer:(NSString *)refer;

/***
 * 注册op类广告
 * @param container
 */
- (void)registerOpAd:(UIScrollView *)container;

/**
 * 取op类广告高度
 * @param dto
 * @return
 */
- (CGFloat)adOpSuitHeight:(MCDto *)dto;

/***
 * 取op类广告cell
 * @param dto
 * @return
 */
- (MCTapTableCell *)adOpSuitCell:(MCDto *)dto
                       container:(UIScrollView *)container
                       indexPath:(NSIndexPath *)indexPath
                           refer:(NSString *)refer;

/**
 * 解析并添加到数组中
 * @param dict
 * @param dataList
 */
- (void)parseOpDto:(NSDictionary *)dict dataList:(NSMutableArray *)dataList;
@end
