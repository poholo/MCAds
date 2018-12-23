//
// Created by majiancheng on 2017/5/25.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol PlayerPauseViewDelegate <NSObject>

- (void)playerPauseViewPlay;

- (void)closeAndAddPanGesture;

@end

@interface MCPlayerPauseView : UIView


@property(nonatomic, weak) id <PlayerPauseViewDelegate> delegate;


@end