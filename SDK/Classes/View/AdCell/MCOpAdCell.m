//
// Created by majiancheng on 2017/6/2.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCOpAdCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

#import "MCAdvertisementDto.h"


@implementation MCOpAdCell {
    UIImageView *_backImageView;
    MCAdvertisementDto *_advertisementDto;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _backImageView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
            [self.contentView addSubview:imageView];
            imageView;
        });

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _backImageView.frame = self.contentView.bounds;
}

- (void)updateDto:(MCAdvertisementDto *)dto {
    _advertisementDto = dto;
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:dto.imageUrl] placeholderImage:[UIImage imageNamed:@"default_list"]];
}

- (void)clickCell {
    MCAdvertisementDto *dto = _advertisementDto;

//    [dto startAction:nil
//            logParam:[LogParam createWithRefer:[NSString addBaiDuPre:self.logParam.refer]]
//             videoId:nil
//                adId:nil];
}

+ (CGFloat)height {
    return CGRectGetWidth([UIScreen mainScreen].bounds) / 3.0;
}

@end
