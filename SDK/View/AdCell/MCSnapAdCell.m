//
//  MCSnapAdCell.m
//  MCAds
//
//  Created by majiancheng on 17/4/6.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MCSnapAdCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

#import "MCMobileSSP.h"
#import "MCAdDto.h"
#import "UIView+AdCorner.h"
#import "MCColor.h"
#import "NSString+Extend.h"

@implementation MCSnapAdCell {
    UIImageView *_iconImageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _iconImageView = ({
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            [self.contentView addSubview:imageView];
            [imageView addCorner:15];
            imageView;
        });
    }
    return self;
}

- (void)updateStyle {
    self.titleLabel.textColor = [MCColor colorII];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.numberOfLines = 2;

    self.infoLabel.textColor = [MCColor colorII];
    self.infoLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.popularizeLabel.layer.borderWidth = 0;
    self.popularizeLabel.backgroundColor = [UIColor clearColor];
    [self.picImageView addDefaultCorner];
    [self.logoView addDefaultCorner];
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.frame = self.bounds;
    CGFloat maxWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat imgHeight = 60 * .75f;
    CGFloat imgWidth = maxWidth / 2.0f;
    self.picImageView.frame = CGRectMake(0, 0, imgWidth, imgHeight);

    self.adImageView.frame = CGRectMake(maxWidth - 12.5f, 0.0f, 12.5f, 7.0f);

    [self.popularizeLabel setFrame:CGRectMake(0, imgHeight - 15, 30, 15)];
    CGSize logoSize = self.logoView.image.size;
    self.logoView.frame = CGRectMake(CGRectGetMaxX(self.picImageView.frame) - logoSize.width, imgHeight - logoSize.height, logoSize.width, logoSize.height);

    CGSize size = [self.titleLabel.text size4size:CGSizeMake(maxWidth - 30, 30) font:self.titleLabel.font];
    if (size.height > 40.0f) {
        size.height = 40.0f;
    }
    self.titleLabel.frame = CGRectMake(10, imgHeight + 10, imgWidth - 30, size.height);
    _iconImageView.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame) + 10, 30, 30);
    self.infoLabel.frame = CGRectMake(45, CGRectGetMinY(_iconImageView.frame) + 15.0f - 7.5f, imgWidth - 60, 15);
}

- (void)setAdModel:(MCAdDto *)model {
    [super setAdModel:model];
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.nativeAdDto.mainImageURLString] placeholderImage:[UIImage imageNamed:@"default_list"]];
    [self setNeedsLayout];
}

- (NSString *)apId {
    return [[MCMobileSSP sharedInstance] apIdAdType:SSPDataFlow];
}

+ (CGSize)size {
    return CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) / 2.0f, 60 + 34.0f);
}

@end
