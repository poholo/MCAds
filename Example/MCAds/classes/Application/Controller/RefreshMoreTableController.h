//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshMoreTableController : UITableViewController

- (void)pullToRefresh;

- (void)triggerPullToRefresh;

- (void)refresh;

- (void)more;

- (void)stopRefresh;

- (void)stopMore;

- (void)stopAll;

- (void)removeRefresh:(BOOL)removed;

- (void)removeMore:(BOOL)removed;

@end