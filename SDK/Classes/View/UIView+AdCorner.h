//
// Created by majiancheng on 2017/12/26.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AdCorner)

/**
 * 默认圆角
 */
- (void)addDefaultCorner;

/**
 * 自定义圆角
 * @param radius 半径
 */
- (void)addCorner:(CGFloat)radius;

/**
 * Border color
 * @param radius 半径
 * @param color 颜色
 */
- (void)addCorner:(CGFloat)radius borderColor:(UIColor *)color;

/**
 * 设置边框颜色 宽度
 * @param radius 半径
 * @param color 颜色
 * @param borderWidth 边框宽度
 */
- (void)addCorner:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

/**
 * 部分圆角左边
 * @param radius 半径
 * @param color 颜色
 * @param borderWidth 边框宽度
 */
- (void)addLeftCorner:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

/**
 * 部分圆角右边
 * @param radius 半径
 * @param color 颜色
 * @param borderWidth 边框宽度
 */
- (void)addRightCorner:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

/**
 * 部分圆角上边
 * @param radius 半径
 * @param color 颜色
 * @param borderWidth 边框宽度
 */
- (void)adTopCorner:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

/**
 * 部分圆角下边
 * @param radius 半径
 * @param color 颜色
 * @param borderWidth 边框宽度
 */
- (void)addBottomCorner:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

/**
 * 自定义部分圆角
 * @param radius 半径
 * @param color 颜色
 * @param borderWidth 边框宽度
 */
- (void)addCorner:(UIRectCorner)corns radius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

- (void)addBorderCorner:(UIRectCorner)corns radius:(CGFloat)radius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;


@end