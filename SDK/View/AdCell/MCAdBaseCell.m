//
//  AdCell.m
//  MCAds
//
//  Created by majiancheng on 15/12/9.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//


#import "MCAdBaseCell.h"

#import "MCMobAdNativeAdView.h"
#import "MCAdsManager.h"
#import "MCAdBaseView.h"
#import "MCAdDto.h"
#import "MCInmobiDto.h"

@implementation MCAdBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.baseView = [[MCAdBaseView alloc] init];
        self.baseView.apId = [self apId];
        [self.contentView addSubview:self.baseView];
        [self updateStyle];
    }
    return self;
}

- (void)setAdPostion:(NSIndexPath *)indexPath {
    self.baseView.indexPath = indexPath;
}

- (void)setAdType:(NSString *)adType {
    self.baseView.type = adType;
}

- (void)setAdPicType:(MCAdStyleType)picType {
    self.baseView.picType = picType;
}

- (void)setAdRefer:(NSString *)refreId {
    self.baseView.referId = refreId;
}

- (NSString *)apId {
    return [[MCAdsManager share] apIdAdType:MCAdCategoryDataFlow];
}

- (void)updateStyle {

}

- (void)setAdModel:(MCAdDto *)mmAdDto {
    [self.baseView setAdModel:mmAdDto];
    [self updateStyle];
    [self setNeedsLayout];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
}

- (void)trackImpression {
    [self.baseView trackImpression];
}

- (void)clickCell {
    [self.baseView clickAd];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.baseView.frame = self.bounds;
    [self.baseView setNeedsUpdateConstraints];
    [self.baseView updateConstraintsIfNeeded];
    [self.baseView layoutIfNeeded];
}

#pragma mark - getter

- (UIImageView *)picImageView {
    return self.baseView.picImageView;
}

- (UILabel *)titleLabel {
    return self.baseView.titleLabel;
}

- (UILabel *)infoLabel {
    return self.baseView.infoLabel;
}

- (UILabel *)popularizeLabel {
    return self.baseView.popularizeLabel;
}

- (UIImageView *)logoView {
    return self.baseView.logoView;
}

- (UIImageView *)adImageView {
    return self.baseView.adImageView;
}

- (UIView *)videoView {
    return self.baseView.videoView;
}


@end
