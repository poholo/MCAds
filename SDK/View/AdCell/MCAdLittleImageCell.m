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

@implementation MCAdLittleImageCell

- (void)updateStyle {
    self.titleLabel.textColor = [MCColor colorII];
    self.titleLabel.font = [MCFont fontVI];
    [self.picImageView addDefaultCorner];
    [self.logoView addDefaultCorner];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat top = 5;
    self.picImageView.frame = CGRectMake(15, top, 140, 70);

    CGFloat maxWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat screenWidth9Division16 = maxWidth * 9 / 16.0f;

    CGSize titleSize = [self.titleLabel.text size4size:CGSizeMake(maxWidth - 140 - 40, CGFLOAT_MAX) font:self.titleLabel.font];
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.picImageView.frame) + 10, top, titleSize.width, titleSize.height);

    [self.popularizeLabel setFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame) + 5, 30, 15)];

    CGSize infoSize = [self.infoLabel.text size4size:CGSizeMake(maxWidth - 140 - 40, CGFLOAT_MAX) font:self.infoLabel.font];
    self.infoLabel.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), 75 - infoSize.height, infoSize.width, infoSize.height);
    self.adImageView.frame = CGRectMake(CGRectGetMaxX(self.picImageView.frame) - 12.5, CGRectGetMaxY(self.picImageView.frame) - 7, 12.5, 7);

    CGSize size = self.logoView.image.size;
    CGRect picFrame = self.picImageView.frame;
    self.logoView.frame = CGRectMake(CGRectGetMaxX(picFrame) - size.width, CGRectGetMaxY(self.picImageView.frame) - size.height, size.width, size.height);
}

+ (CGFloat)height {
    return 80;
}

- (NSString *)apId {
    return [[MCAdsManager share] apIdAdType:SSPDataFlow];
}

@end
