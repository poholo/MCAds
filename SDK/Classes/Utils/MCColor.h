//
// Created by majiancheng on 2018/12/19.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCColor : UIColor

/***
 * 字体色 - 主要
 */
+ (UIColor *)colorI;

/***
 * 字体色 - 次要II
 */
+ (UIColor *)colorII;

/***
 * 字体色 - 次要III
 */
+ (UIColor *)colorIII;

/***
 * 字体色 - 提示性文字
 */
+ (UIColor *)colorIV;

/***
 * 背景 - 分行&底色
 */
+ (UIColor *)colorV;

/***
 * 分割线
 */
+ (UIColor *)colorVI;


/***
 * 主色 - 蓝
 */
+ (UIColor *)colorVII;

/***
 * 主色 - 黄
 */
+ (UIColor *)colorVIII;

/***
 * 副主色 - 深灰色
 */
+ (UIColor *)colorIX;

/**
 * 副主色 - 浅灰色
 */
+ (UIColor *)colorX;

/**
 * 副主色 - 浅绿色
 */
+ (UIColor *)colorXI;

/**
 * 副主色 - 浅红色
 */
+ (UIColor *)colorXII;

+ (UIColor *)randomImageColor;

+ (UIColor *)colorWithHexInt:(NSUInteger)rgbValue;

@end