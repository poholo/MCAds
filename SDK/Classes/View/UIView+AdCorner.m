//
// Created by majiancheng on 2017/12/26.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "UIView+AdCorner.h"

#import "MCStyle.h"

@implementation UIView (AdCorner)

- (void)addDefaultCorner {
    [self addCorner:[MCStyle cornorRadius]];
}

- (void)addCorner:(CGFloat)radius {
    [self addCorner:radius borderColor:nil];
}

- (void)addCorner:(CGFloat)radius borderColor:(UIColor *)color {
    [self addCorner:radius borderColor:color borderWidth:0];
}

- (void)addCorner:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.allowsEdgeAntialiasing = YES;
}

- (void)addLeftCorner:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *shape = [CAShapeLayer new];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
}


- (void)addRightCorner:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                  byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight
                                                        cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *shape = [CAShapeLayer new];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
}

- (void)adTopCorner:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                  byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft
                                                        cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *shape = [CAShapeLayer new];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
}

- (void)addBottomCorner:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                  byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight
                                                        cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *shape = [CAShapeLayer new];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
}

- (void)addCorner:(UIRectCorner)corns radius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                  byRoundingCorners:corns
                                                        cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *shape = [CAShapeLayer new];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
}

- (void)addBorderCorner:(UIRectCorner)corns radius:(CGFloat)radius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:corns
                                                     cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *tempLayer = [CAShapeLayer new];
    tempLayer.frame = self.bounds;
    tempLayer.path = path.CGPath;
    tempLayer.fillColor = [UIColor clearColor].CGColor;
    tempLayer.strokeColor = borderColor.CGColor;
    tempLayer.lineWidth = borderWidth;
    [self.layer addSublayer:tempLayer];

    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] initWithLayer:tempLayer];
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}

@end