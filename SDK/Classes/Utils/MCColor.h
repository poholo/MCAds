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
 * 背景 - 分行&底色
 */
+ (UIColor *)colorV;

/***
 * 分割线
 */
+ (UIColor *)colorVI;


+ (UIColor *)randomImageColor;

+ (UIColor *)rgb:(NSUInteger)rgbValue;

@end