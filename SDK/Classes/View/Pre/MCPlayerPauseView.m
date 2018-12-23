//
// Created by majiancheng on 2017/5/25.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCPlayerPauseView.h"

#import "MCAdBaseView.h"
#import "MCAdsManager.h"

@interface MCPlayerPauseView ()

@property(nonatomic, strong) UIView *tapView;
@property(nonatomic, strong) MCAdBaseView *adBaseView;

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UIButton *closeBtn;
@end

@implementation MCPlayerPauseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _tapView = ({
            UIView *view = [[UIView alloc] initWithFrame:self.bounds];
            view.backgroundColor = [UIColor blackColor];
            view.alpha = .7;
            /*
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
            [view addGestureRecognizer:tap];
            [self addSubview:view];
             */
            view;
        });

        _adBaseView = ({
            MCAdBaseView *baseView = [[MCAdBaseView alloc] initWithFrame:CGRectMake((frame.size.width - 260) / 2.0f,
                    (frame.size.height - 160) / 2.0f,
                    260,
                    160)];
            [baseView setReferId:nil];
            baseView.picImageView.frame = baseView.bounds;
            CGSize size = baseView.logoView.image.size;
            baseView.logoView.frame = CGRectMake(CGRectGetWidth(baseView.frame),
                    CGRectGetMaxY(baseView.picImageView.frame) - size.height,
                    size.width,
                    size.height);
            baseView.adImageView.frame = CGRectMake((CGFloat) (CGRectGetMaxX(baseView.picImageView.frame) - 12.5),
                    CGRectGetMaxY(baseView.picImageView.frame) - 7,
                    12.5,
                    7);
            [self addSubview:baseView];
            baseView.infoLabel.hidden = YES;
            baseView.titleLabel.hidden = YES;
            baseView;
        });

        MCAdDto *adDto = [[MCAdsManager share] takeOneAd:MCAdCategoryDataPause];
        [_adBaseView setAdModel:adDto];
        _adBaseView.referId = nil;

        [_adBaseView trackImpression];

        _titleLabel = ({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_adBaseView.frame),
                    CGRectGetMaxY(_adBaseView.frame) + 10,
                    CGRectGetWidth(_adBaseView.frame),
                    20)];
            label.textColor = [UIColor whiteColor];
            label.text = @"休息一下，精彩继续";
            label.font = [UIFont systemFontOfSize:18];
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            label;
        });

        _closeBtn = ({
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_adBaseView.frame) - 15,
                    CGRectGetMinY(_adBaseView.frame) - 15,
                    30,
                    30)];
            [btn setImage:[UIImage imageNamed:@"ic_ad_close"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            btn;

        });

    }
    return self;
}

- (void)tapClick {
//    if ([self.delegate respondsToSelector:@selector(playerPauseViewPlay)]) {
//        [self.delegate playerPauseViewPlay];
//    }

    if ([self.delegate respondsToSelector:@selector(closeAndAddPanGesture)]) {
        [self.delegate closeAndAddPanGesture];
    }
    [self removeFromSuperview];
    self.hidden = YES;
}

- (void)closeClick {
    [self tapClick];
}

@end
