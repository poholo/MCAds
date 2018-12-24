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
#import "AdCateDto.h"
#import "MCAdsManager.h"
#import "MCSplashService.h"
#import "DataFlowController.h"
#import "MCAdConfig.h"
#import "MCAdvertisementDto.h"

@interface RootController ()

@property(nonatomic, strong) UISegmentedControl *segmentedControl;

@property(nonatomic, strong) RootDataVM *dataVM;

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"广告样式";
    [self.tableView registerClass:[RootCell class] forCellReuseIdentifier:[RootCell identifier]];
    [self pullToRefresh];
    [self.navigationItem.titleView removeFromSuperview];
    self.navigationItem.titleView = self.segmentedControl;
}

- (void)pullToRefresh {
    __weak typeof(self) weakSelf = self;
    [self.dataVM reqHomeData:self.segmentedControl.selectedSegmentIndex callBack:^(BOOL succcess, NSArray *dataList) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.tableView reloadData];
    }];
}

- (void)segmentedControlClick {
    [[MCAdsManager share] changeConfig:(MCAdSourceType) self.segmentedControl.selectedSegmentIndex];
    [self pullToRefresh];
}

#pragma mark - table

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AdCateDto *cateDto = (AdCateDto *) self.dataVM.dataList[indexPath.section];
    AdCateDto *subCateDto = cateDto.cateDtos[indexPath.row];
    RootCell *cell = [tableView dequeueReusableCellWithIdentifier:[RootCell identifier] forIndexPath:indexPath];
    [cell loadData:subCateDto];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    AdCateDto *cateDto = (AdCateDto *) self.dataVM.dataList[section];
    return cateDto.cateDtos.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataVM.dataList.count;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    AdCateDto *cateDto = (AdCateDto *) self.dataVM.dataList[section];
    return cateDto.name;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AdCateDto *cateDto = self.dataVM.dataList[indexPath.section];
    if ([cateDto.entityId isEqualToString:@"0"]) {
        if (self.segmentedControl.selectedSegmentIndex == 2) {
            if (indexPath.row == 1) {
                [MCAdsManager share].splashConfig.advertisementDto.videoUrl = @"http://ksy.fffffive.com/mda-hfshah045smezhtf/mda-hfshah045smezhtf.mp4";
            } else {
                [MCAdsManager share].splashConfig.advertisementDto.videoUrl = nil;

            }
        }
        [[MCAdsManager share].splashService showSplash];
    } else if ([cateDto.entityId isEqualToString:@"1"]
            || [cateDto.entityId isEqualToString:@"2"]
            || [cateDto.entityId isEqualToString:@"3"]) {
        AdCateDto *subCateDto = cateDto.cateDtos[indexPath.row];
        DataFlowController *dataFlowController = [[DataFlowController alloc] initWithCate:subCateDto];
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

- (UISegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"百度", @"广点通", @"自定义"]];
        _segmentedControl.frame = CGRectMake(0, 0, 300, 30);
        _segmentedControl.selectedSegmentIndex = 0;
        [_segmentedControl addTarget:self action:@selector(segmentedControlClick) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}
@end
