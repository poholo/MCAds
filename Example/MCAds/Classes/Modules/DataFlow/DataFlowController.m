//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "DataFlowController.h"

#import "AdCateDto.h"
#import "DataFlowDataVM.h"
#import "NSObject+Ad.h"
#import "MCAdDto.h"
#import "VideoCell.h"
#import "VideoDto.h"

@interface DataFlowController ()

@property(nonatomic, strong) DataFlowDataVM *dataVM;

@end

@implementation DataFlowController

- (instancetype)initWithCate:(AdCateDto *)cateDto {
    self = [super init];
    if (self) {
        self.dataVM.cateDto = cateDto;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.dataVM.cateDto.name;
    [self registerCommenAdCell:self.tableView];
    [self.tableView registerClass:[VideoCell class] forCellReuseIdentifier:[VideoCell identifier]];
    [self pullToRefresh];
}

- (void)refresh {
    if (self.dataVM.isRefresh) return;
    [self.dataVM refresh];
    [self loadData];
}

- (void)more {
    [self loadData];
}

- (void)loadData {
    __weak typeof(self) weakSelf = self;
    [self.dataVM reqDataFlow:^(BOOL success, NSMutableArray *dataList) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (success) {
            if (strongSelf.dataVM.isRefresh) {
                [strongSelf stopRefresh];
            } else {
                [strongSelf stopMore];
            }
        } else {
            [strongSelf stopAll];
        }
        strongSelf.dataVM.isRefresh = NO;
    }];
}

#pragma mark - table

- (MCTableCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCDto *dto = self.dataVM.dataList[indexPath.row];
    if ([dto isKindOfClass:[MCAdDto class]]) {
        MCAdDto *adDto = (MCAdDto *) dto;
        MCAdBaseCell *cell = [self adSuiltCell:adDto.styleType container:self.tableView indexPath:indexPath adDto:adDto refer:nil];
        return (MCTableCell *)cell;
    } else if ([dto isKindOfClass:[VideoDto class]]) {
        VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:[VideoCell identifier] forIndexPath:indexPath];
        [cell loadData:(VideoDto *) dto];
        return cell;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataVM.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCDto *dto = self.dataVM.dataList[indexPath.row];
    if ([dto isKindOfClass:[MCAdDto class]]) {
        MCAdDto *adDto = (MCAdDto *) dto;
        return [self adSuiltHeight:adDto.styleType];
    } else if ([dto isKindOfClass:[VideoDto class]]) {
        return [VideoCell height];
    }
    return 0;
}

#pragma mark - getter

- (DataFlowDataVM *)dataVM {
    if (!_dataVM) {
        _dataVM = [DataFlowDataVM new];
    }
    return _dataVM;
}
@end
