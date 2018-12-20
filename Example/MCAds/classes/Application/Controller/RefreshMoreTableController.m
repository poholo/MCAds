//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "RefreshMoreTableController.h"
#import "MJRefreshHeader.h"
#import "MJRefreshFooter.h"

#import <UIScrollView+MJRefresh.h>


@implementation RefreshMoreTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self configRefresh];
}

- (void)configRefresh {
    __weak typeof(self) weakSelf = self;
    [self.tableView setMj_header:[MJRefreshHeader headerWithRefreshingBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf refresh];
    }]];

    [self.tableView setMj_footer:[MJRefreshFooter footerWithRefreshingBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [self more];
    }]];
}

- (void)triggerPullToRefresh {
    [self.tableView.mj_header beginRefreshing];
}

- (void)pullToRefresh {
    [self refresh];
}


- (void)refresh {

}

- (void)more {

}

- (void)stopRefresh {
    [self.tableView.mj_header endRefreshing];
}

- (void)stopMore {
    [self.tableView.mj_footer endRefreshing];
}

- (void)stopAll {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


- (void)removeRefresh:(BOOL)removed {
    self.tableView.mj_header.hidden = removed;
}

- (void)removeMore:(BOOL)removed {
    self.tableView.mj_footer.hidden = removed;
}

@end