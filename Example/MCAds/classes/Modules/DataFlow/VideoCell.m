//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "VideoCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

#import "VideoDto.h"
#import "MCColor.h"


@interface VideoCell ()

@property(nonatomic, strong) UIImageView *coverImageView;
@property(nonatomic, strong) UILabel *titleLabel;

@end

@implementation VideoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.coverImageView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)loadData:(VideoDto *)dto {
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:dto.img]];
    self.titleLabel.text = dto.title;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.coverImageView.frame = self.contentView.bounds;
    self.titleLabel.frame = CGRectMake(10, CGRectGetHeight(self.frame) - 20, CGRectGetWidth(self.frame) - 20, 15);
}

#pragma mark - getter

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [UIImageView new];
        _coverImageView.backgroundColor = [MCColor randomImageColor];
    }
    return _coverImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [MCColor colorII];
    }
    return _titleLabel;
}

+ (CGFloat)height {
    return 100;
}


@end