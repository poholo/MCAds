//
// Created by majiancheng on 2017/5/24.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCAdCollectionBaseCell.h"

#import "MCAdBaseView.h"
#import "MCAdsManager.h"

@interface MCAdCollectionBaseCell ()

@property(nonatomic, strong) MCAdBaseView *baseView;

@end

@implementation MCAdCollectionBaseCell

- (void)dealloc {
    MCLog(@"[%@]dealloc", NSStringFromClass(self.class));
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.baseView = [[MCAdBaseView alloc] initWithFrame:self.bounds];
        self.baseView.apId = [self apId];
        [self.contentView addSubview:self.baseView];
        [self updateStyle];
    }
    return self;
}

- (void)cellLogPostion:(NSInteger)postion {

}

- (void)setAdPostion:(NSIndexPath *)indexPath {
    self.baseView.indexPath = indexPath;
}

- (void)setAdType:(NSString *)adType {
    self.baseView.type = adType;
}

- (void)setAdPicType:(AdDisplayStyleType)picType {
    self.baseView.picType = picType;
}

- (void)setAdRefer:(NSString *)refreId {
    self.baseView.referId = refreId;
}

- (void)updateStyle {

}

- (NSString *)apId {
    return [[MCAdsManager share] apIdAdType:SSPDataFlow];
}


- (void)setAdModel:(MCAdDto *)mmAdDto {
    [self.baseView setAdModel:mmAdDto];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
}

- (void)trackImpression {
    [self.baseView trackImpression];
}

- (void)clickAd {
    [self.baseView clickAd];
}

- (void)layoutSubviews {
    [super layoutSubviews];
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

+ (NSString *)identifier {
    return NSStringFromClass(self.class);
}

+ (CGSize)size {
    CGSize result = CGSizeMake(100, 100);
    return result;
}


@end
