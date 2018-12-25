//
//  MCAdLittleImageCell.m
//  MCAds
//
//  Created by majiancheng on 2017/5/24.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MCAdLittleImageCell.h"
#import "MCAdBaseView.h"
#import "MCAdsManager.h"
#import "UIView+AdCorner.h"
#import "MCColor.h"
#import "MCFont.h"
#import "NSString+Extend.h"
#import "MCStyle.h"

@implementation MCAdLittleImageCell

- (void)updateStyle {
    self.titleLabel.textColor = [MCColor colorII];
    self.titleLabel.font = [MCFont fontIII];
    [self.picImageView addDefaultCorner];
    [self.logoView addDefaultCorner];
    [self.videoView addDefaultCorner];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat top = [MCStyle contentInset].top;
    CGFloat left = [MCStyle contentInset].left;
    CGFloat margin = 10;
    self.picImageView.frame = CGRectMake(left, top, 140, 70);
    [self.baseView refreshVideoFrame:self.picImageView.frame];

    CGFloat maxWidth = CGRectGetWidth([UIScreen mainScreen].bounds);

    CGSize titleSize = [self.titleLabel.text size4size:CGSizeMake(maxWidth - 140 - left * 2 - margin , CGFLOAT_MAX) font:self.titleLabel.font];
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.picImageView.frame) + margin, top, titleSize.width, titleSize.height);

    CGSize infoSize = [self.infoLabel.text size4size:CGSizeMake(maxWidth - 140 - left * 2 - margin, CGFLOAT_MAX) font:self.infoLabel.font];
    self.infoLabel.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), 75 - infoSize.height, infoSize.width, infoSize.height);
    self.popularizeLabel.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMinY(self.infoLabel.frame) - 15, 30, 15);
    self.adImageView.frame = CGRectMake(CGRectGetMaxX(self.picImageView.frame) - 12.5, CGRectGetMaxY(self.picImageView.frame) - 7, 12.5, 7);

    CGSize size = self.logoView.image.size;
    CGRect picFrame = self.picImageView.frame;
    self.logoView.frame = CGRectMake(CGRectGetMaxX(picFrame) - size.width, CGRectGetMaxY(self.picImageView.frame) - size.height, size.width, size.height);
}

+ (CGFloat)height {
    return 80;
}

- (NSString *)apId {
    return [[MCAdsManager share] apIdAdType:MCAdCategoryDataFlow];
}

@end
