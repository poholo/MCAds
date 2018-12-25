//
// Created by majiancheng on 2017/5/24.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCAdContinuePlayCollectionCell.h"

#import "MCAdsManager.h"
#import "UIView+AdCorner.h"
#import "MCColor.h"
#import "MCFont.h"
#import "NSString+Extend.h"


@implementation MCAdContinuePlayCollectionCell

- (void)updateStyle {
    self.titleLabel.textColor = [MCColor colorII];
    self.titleLabel.font = [MCFont fontII];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.infoLabel.hidden = YES;
    [self.picImageView addDefaultCorner];
    [self.logoView addDefaultCorner];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.frame = self.bounds;

    self.picImageView.frame = CGRectMake(0, 0, 95, 58);

    self.logoView.frame = CGRectMake(0, CGRectGetMaxY(self.picImageView.frame) - 10, 10, 10);
    self.adImageView.frame = CGRectMake((CGFloat) (CGRectGetMaxX(self.picImageView.frame) - 12.5), CGRectGetMaxY(self.picImageView.frame) - 7, 12.5, 7);

    [self.popularizeLabel setFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame) + 5, 30, 15)];

    CGSize size = [self.titleLabel.text size4size:CGSizeMake(95, CGFLOAT_MAX) font:self.titleLabel.font];
    self.titleLabel.frame = CGRectMake(0, 60, 95, size.width < 30 ? size.width : 30);

    CGSize imageSize = self.logoView.image.size;
    CGRect picFrame = self.frame;
    self.logoView.frame = CGRectMake(picFrame.size.width - imageSize.width, CGRectGetMaxY(self.picImageView.frame) - imageSize.height, imageSize.width, imageSize.height);
}

- (NSString *)apId {
    return [[MCAdsManager share] apIdAdType:MCAdCategoryDataFlow];
}


+ (CGSize)size {
    return CGSizeMake(95, 95);
}
@end
