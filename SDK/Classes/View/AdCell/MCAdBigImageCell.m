//
//  MCAdBigImageCell.m
//  MCAds
//
//  Created by majiancheng on 2017/5/24.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MCAdBigImageCell.h"

#import "MCAdsManager.h"
#import "UIView+AdCorner.h"
#import "NSString+Extend.h"
#import "MCAdBaseView.h"
#import "MCStyle.h"

@implementation MCAdBigImageCell

- (void)updateStyle {
    [self.picImageView addDefaultCorner];
    [self.logoView addDefaultCorner];
    [self.videoView addDefaultCorner];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat top = [MCStyle contentInset].top;
    CGFloat leftRightMargin = [MCStyle contentInset].left;

    CGFloat maxWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat screenWidth9Division16 = maxWidth * 9 / 16.0f;
    CGSize titleSize = [self.titleLabel.text size4size:CGSizeMake(maxWidth - 2 * leftRightMargin, CGFLOAT_MAX) font:self.titleLabel.font];
    self.titleLabel.frame = CGRectMake(leftRightMargin, top, titleSize.width, titleSize.height);

    self.picImageView.frame = CGRectMake(leftRightMargin, CGRectGetMaxY(self.titleLabel.frame) + 10, maxWidth - 2 * leftRightMargin, screenWidth9Division16);
    [self.baseView refreshVideoFrame:self.picImageView.frame];

    [self.popularizeLabel setFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.picImageView.frame) + 5, 30, 15)];

    CGSize infoSize = [self.infoLabel.text size4size:CGSizeMake(maxWidth - 2 * leftRightMargin - 25, 20) font:self.infoLabel.font];
    self.infoLabel.frame = CGRectMake(CGRectGetMaxX(self.popularizeLabel.frame) + 5, CGRectGetMinY(self.popularizeLabel.frame), infoSize.width, infoSize.height);

    CGSize size = self.logoView.image.size;
    self.logoView.frame = CGRectMake(CGRectGetMaxX(self.picImageView.frame) - size.width, CGRectGetMaxY(self.picImageView.frame) - size.height, size.width, size.height);
    self.adImageView.frame = CGRectMake(CGRectGetMaxX(self.picImageView.frame) - 12.5, CGRectGetMaxY(self.picImageView.frame) - 7, 12.5, 7);
}

+ (CGFloat)height {
    CGFloat maxWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat screenWidth9Division16 = maxWidth * 9 / 16.0f;
    return screenWidth9Division16 + 70;
}

- (NSString *)apId {
    return [[MCAdsManager share] apIdAdType:MCAdCategoryDataFlow];
}


@end
