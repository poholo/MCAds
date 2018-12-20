//
//  RootController.m
//  MCAds
//
//  Created by majiancheng on 2018/12/18.
//  Copyright © 2018 majiancheng. All rights reserved.
//

#import "RootController.h"

#import "RootCell.h"
#import "RootDataVM.h"
#import "MCDto.h"
#import "RootCateDto.h"
#import "MCAdsManager.h"
#import "MCSplashService.h"
#import "DataFlowController.h"

@interface RootController ()

@property(nonatomic, strong) RootDataVM *dataVM;

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"广告样式";
    [self.tableView registerClass:[RootCell class] forCellReuseIdentifier:[RootCell identifier]];
    [self pullToRefresh];
}

- (void)pullToRefresh {
    __weak typeof(self) weakSelf = self;
    [self.dataVM reqHomeData:^(BOOL succcess, NSArray *dataList) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.tableView reloadData];
    }];
}

#pragma mark - table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RootCell *cell = [tableView dequeueReusableCellWithIdentifier:[RootCell identifier] forIndexPath:indexPath];
    [cell loadData:self.dataVM.dataList[indexPath.row]];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataVM.dataList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RootCateDto *cateDto = self.dataVM.dataList[indexPath.row];
    if ([cateDto.entityId isEqualToString:@"0"]) {
        [[MCAdsManager share].splashService showSplash];
    } else if ([cateDto.entityId isEqualToString:@"1"]
            || [cateDto.entityId isEqualToString:@"2"]
            || [cateDto.entityId isEqualToString:@"3"]) {
        DataFlowController *dataFlowController = [[DataFlowController alloc] initWithCate:cateDto];
        [self.navigationController pushViewController:dataFlowController animated:YES];
    }
}

#pragma mark -getter

- (RootDataVM *)dataVM {
    if (!_dataVM) {
        _dataVM = [RootDataVM new];
    }
    return _dataVM;
}
@end
