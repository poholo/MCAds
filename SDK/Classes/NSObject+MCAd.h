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
@class MCTableCell;


@interface NSObject (MCAd)
/***
 * 注册广告通用cell
 * @param container 广告展示容器
 */
- (void)registerCommenAdCell:(UIScrollView *)container;

/**
 * 广告通用取高度
 * @param type 类型
 * @return MCAdBaseCell 对应的AdCell高度
 */
- (CGFloat)adSuiltHeight:(MCAdStyleType)type;

/**
 *TableView 广告通用cell包含日志上报
 * @param type  广告样式
 * @param container 容器
 * @param indexPath 位置
 * @param adDto 广告
 * @return MCAdBaseCell 对应的AdCell
 */
- (MCAdBaseCell *)adSuiltCell:(MCAdStyleType)type
                    container:(UIScrollView *)container
                    indexPath:(NSIndexPath *)indexPath
                        adDto:(MCAdDto *)adDto
                        refer:(NSString *)refer;

/**
 * CollectionView广告通用取size
 * @param type 展示类型
 * @return MCAdCollectionBaseCell collection对应的AdCell高度
 */
- (CGSize)adCollectionViewSuiltHeight:(MCAdStyleType)type;

/**
 * CollectionView广告通用cell包含日志上报
 * @param type  广告样式
 * @param container 容器
 * @param indexPath 位置
 * @param adDto 广告
 * @return MCAdCollectionBaseCell collection对应的AdCell
 */
- (MCAdCollectionBaseCell *)adSuiltCollectionViewCell:(MCAdStyleType)type
                                            container:(UIScrollView *)container
                                            indexPath:(NSIndexPath *)indexPath
                                                adDto:(MCDto *)adDto
                                                refer:(NSString *)refer;

/***
 * 注册op类广告
 * @param container 广告展示容器
 */
- (void)registerOpAd:(UIScrollView *)container;

/**
 * 取op类广告高度
 * @param dto 实体
 * @return CGFloat 高度
 */
- (CGFloat)adOpSuitHeight:(MCDto *)dto;

/***
 * 取op类广告cell
 * @param dto 实体
 * @return  MCTableCell 样式
 */
- (MCTableCell *)adOpSuitCell:(MCDto *)dto
                    container:(UIScrollView *)container
                    indexPath:(NSIndexPath *)indexPath
                        refer:(NSString *)refer;

/**
 * 解析并添加到数组中
 * @param dict 解析字典
 * @param dataList 数组
 */
- (void)parseOpDto:(NSDictionary *)dict dataList:(NSMutableArray *)dataList;

@end
