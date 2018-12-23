//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "RefreshMoreTableController.h"

#import <UIScrollView+MJRefresh.h>
#import <MJRefresh/MJRefreshBackNormalFooter.h>

#import "MJRefreshNormalHeader.h"


@implementation RefreshMoreTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self configRefresh];
}

- (void)configRefresh {
    __weak typeof(self) weakSelf = self;
    [self.tableView setMj_header:[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf refresh];
    }]];

    [self.tableView setMj_footer:[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf more];
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
    [self.tableView reloadData];
}

- (void)stopMore {
    [self.tableView.mj_footer endRefreshing];
    [self.tableView reloadData];
}

- (void)stopAll {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
    [self.tableView reloadData];
}


- (void)removeRefresh:(BOOL)removed {
    self.tableView.mj_header.hidden = removed;
}

- (void)removeMore:(BOOL)removed {
    self.tableView.mj_footer.hidden = removed;
}

@end
