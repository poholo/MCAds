//
//  MCAdOrientionImageCell.m
//  MCAds
//
//  Created by majiancheng on 2017/5/24.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MCAdOrientionImageCell.h"

#import "UIView+AdCorner.h"
#import "NSString+Extend.h"
#import "MCColor.h"

@implementation MCAdOrientionImageCell

- (void)updateStyle {
    [self.picImageView addDefaultCorner];
    [self.logoView addDefaultCorner];
    self.titleLabel.textColor = [MCColor whiteColor];
    self.infoLabel.textColor = [MCColor whiteColor];
    self.popularizeLabel.textColor = [MCColor whiteColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat top = [self marginTopBottom];
    CGFloat leftRightMargin = [self marginLeftRight];
    CGFloat maxWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat height = 100;
    self.picImageView.frame = CGRectMake(leftRightMargin, top, maxWidth - 2 * leftRightMargin, height);

    self.popularizeLabel.frame = CGRectMake(leftRightMargin + leftRightMargin, CGRectGetMaxY(self.picImageView.frame) - 20, 30, 15);

    CGSize infoSize = [self.infoLabel.text size4size:CGSizeMake(maxWidth - 2 * leftRightMargin - 25, 20) font:self.infoLabel.font];
    self.infoLabel.frame = CGRectMake(CGRectGetMaxX(self.popularizeLabel.frame) + 5, CGRectGetMinY(self.popularizeLabel.frame), infoSize.width, infoSize.height);

    CGSize titleSize = [self.titleLabel.text size4size:CGSizeMake(maxWidth - 2 * leftRightMargin, CGFLOAT_MAX) font:self.titleLabel.font];
    self.titleLabel.frame = CGRectMake(CGRectGetMinX(self.popularizeLabel.frame), CGRectGetMinY(self.popularizeLabel.frame) - titleSize.height, titleSize.width, titleSize.height);


    CGSize size = self.logoView.image.size;
    self.logoView.frame = CGRectMake(CGRectGetMaxX(self.picImageView.frame) - size.width, CGRectGetMaxY(self.picImageView.frame) - size.height, size.width, size.height);
    self.adImageView.frame = CGRectMake(CGRectGetMaxX(self.picImageView.frame) - 12.5, CGRectGetMaxY(self.picImageView.frame) - 7, 12.5, 7);

}

+ (CGFloat)height {
    CGFloat maxWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat height = 100;
    return height + 24;
}


@end
