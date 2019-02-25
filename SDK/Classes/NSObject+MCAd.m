//
// Created by majiancheng on 2017/5/23.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "NSObject+MCAd.h"

#import "MCAdDto.h"
#import "MCAdLittleImageCell.h"
#import "MCAdBigImageCell.h"
#import "MCAdOrientionImageCell.h"
#import "MCAdMutipleImageCell.h"
#import "MCAdContinuePlayCollectionCell.h"
#import "MCAdCollectionBaseCell.h"
#import "MCAdsManager.h"
#import "MCDto.h"
#import "MCOpAdCell.h"
#import "MCAdvertisementDto.h"
#import "MCSnapAdCell.h"
#import "MCH5AdDto.h"
#import "MCTableCell.h"

@implementation NSObject (MCAd)

- (void)registerCommenAdCell:(UIScrollView *)container {
    if ([container isKindOfClass:[UITableView class]]) {
        [(UITableView *) container registerClass:[MCAdLittleImageCell class] forCellReuseIdentifier:[MCAdLittleImageCell identifier]];
        [(UITableView *) container registerClass:[MCAdBigImageCell class] forCellReuseIdentifier:[MCAdBigImageCell identifier]];
        [(UITableView *) container registerClass:[MCAdOrientionImageCell class] forCellReuseIdentifier:[MCAdOrientionImageCell identifier]];
        [(UITableView *) container registerClass:[MCAdMutipleImageCell class] forCellReuseIdentifier:[MCAdMutipleImageCell identifier]];
    } else if ([container isKindOfClass:[UICollectionView class]]) {
        [(UICollectionView *) container registerClass:[MCAdContinuePlayCollectionCell class] forCellWithReuseIdentifier:[MCAdContinuePlayCollectionCell identifier]];
        [(UICollectionView *) container registerClass:[MCSnapAdCell class] forCellWithReuseIdentifier:[MCSnapAdCell identifier]];
    }
}

- (CGFloat)adSuiltHeight:(MCAdStyleType)type {
    switch (type) {
        case MCAdStyleLittle      : {
            return [MCAdLittleImageCell height];
        }
            break;///< 小图模式
        case MCAdStyleBig         : {
            return [MCAdBigImageCell height];
        }
            break;///< 大图模式
        case MCAdStyleOriention   : {
            return [MCAdOrientionImageCell height];
        }
            break;///< 横幅模式
        case MCAdStyleMutiple     : {
            return [MCAdMutipleImageCell height];
        }
            break;///< 多图模式
        case MCAdStyleContinuePlay : {
            // not need
        }
            break;///< 联播模式
        case MCAdStyleCollection: {

        }
            break;
        case MCAdStyleH5: {
        }
            break;
    }
    return [MCAdLittleImageCell height];
}

- (MCAdBaseCell *)adSuiltCell:(MCAdStyleType)type
                    container:(UIScrollView *)container
                    indexPath:(NSIndexPath *)indexPath
                        adDto:(MCAdDto *)adDto
                        refer:(NSString *)refer {

    MCAdBaseCell *cell = nil;

    switch (type) {
        case MCAdStyleLittle      : {
            cell = [((UITableView *) container) dequeueReusableCellWithIdentifier:[MCAdLittleImageCell identifier] forIndexPath:indexPath];
        }
            break;///< 小图模式
        case MCAdStyleBig         : {
            cell = [(UITableView *) container dequeueReusableCellWithIdentifier:[MCAdBigImageCell identifier] forIndexPath:indexPath];
        }
            break;///< 大图模式
        case MCAdStyleOriention   : {
            cell = [(UITableView *) container dequeueReusableCellWithIdentifier:[MCAdOrientionImageCell identifier] forIndexPath:indexPath];
        }
            break;///< 横幅模式
        case MCAdStyleMutiple     : {
            cell = [(UITableView *) container dequeueReusableCellWithIdentifier:[MCAdMutipleImageCell identifier] forIndexPath:indexPath];
        }
            break;///< 多图模式
        case MCAdStyleContinuePlay : {

        }
            break;///< 联播模式
        case MCAdStyleCollection: {

        }
            break;
        case MCAdStyleH5: {
        }
            break;
    }

    [cell setAdPostion:indexPath];
    [cell setAdModel:adDto];
    [cell setAdRefer:nil];
    [cell trackImpression];

    return cell;
}

- (CGSize)adCollectionViewSuiltHeight:(MCAdStyleType)type {
    switch (type) {
        case MCAdStyleLittle      : {
        }
            break;///< 小图模式
        case MCAdStyleBig         : {
        }
            break;///< 大图模式
        case MCAdStyleOriention   : {
        }
            break;///< 横幅模式
        case MCAdStyleMutiple     : {
        }
            break;///< 多图模式
        case MCAdStyleContinuePlay : {
            return [MCAdContinuePlayCollectionCell size];
        }
            break;///< 联播模式
        case MCAdStyleCollection: {
            return [MCSnapAdCell size];
        }
            break;
        case MCAdStyleH5: {
        }
            break;
    }
    return CGSizeZero;
}

- (MCAdCollectionBaseCell *)adSuiltCollectionViewCell:(MCAdStyleType)type
                                            container:(UIScrollView *)container
                                            indexPath:(NSIndexPath *)indexPath
                                                adDto:(MCDto *)adDto
                                                refer:(NSString *)refer {
    MCAdCollectionBaseCell *cell = nil;

    switch (type) {
        case MCAdStyleLittle      : {
        }
            break;///< 小图模式
        case MCAdStyleBig         : {
        }
            break;///< 大图模式
        case MCAdStyleOriention   : {
        }
            break;///< 横幅模式
        case MCAdStyleMutiple     : {
        }
            break;///< 多图模式
        case MCAdStyleContinuePlay : {
            cell = [(UICollectionView *) container dequeueReusableCellWithReuseIdentifier:[MCAdContinuePlayCollectionCell identifier] forIndexPath:indexPath];
        }
            break;///< 联播模式
        case MCAdStyleCollection: {
            cell = [(UICollectionView *) container dequeueReusableCellWithReuseIdentifier:[MCSnapAdCell identifier] forIndexPath:indexPath];
        }
            break;
        case MCAdStyleH5: {
        }
            break;
    }

    if (cell == nil) {
        cell = [(UICollectionView *) container dequeueReusableCellWithReuseIdentifier:[MCAdContinuePlayCollectionCell identifier] forIndexPath:indexPath];
    }

    if ([adDto isKindOfClass:[MCH5AdDto class]]) {
        MCH5AdDto *h5 = (MCH5AdDto *) adDto;
//        [((SnapCollectionViewCell *) cell) loadAdData:adDto];

    } else if ([adDto isKindOfClass:[MCAdDto class]]) {
        MCAdDto *tmAdDto = (MCAdDto *) adDto;
        [cell setAdPostion:indexPath];
        [cell setAdModel:tmAdDto];
        [cell setAdRefer:nil];
        [cell trackImpression];
        [cell cellLogPostion:indexPath.row];
    }

    return cell;

}


- (void)registerOpAd:(UIScrollView *)container {
    if ([container isKindOfClass:[UITableView class]]) {
        [((UITableView *) container) registerClass:[MCOpAdCell class] forCellReuseIdentifier:[MCOpAdCell identifier]];
    } else {

    }
}

- (CGFloat)adOpSuitHeight:(MCDto *)dto {
    if ([dto isKindOfClass:[MCAdvertisementDto class]]) {
        return [MCOpAdCell height];
    }
    return 0;
}


- (MCTableCell *)adOpSuitCell:(MCDto *)dto container:(UIScrollView *)container indexPath:(NSIndexPath *)indexPath refer:(NSString *)refer {
    if ([dto isKindOfClass:[MCAdvertisementDto class]]) {
        MCOpAdCell *cell = [(UITableView *) container dequeueReusableCellWithIdentifier:[MCOpAdCell identifier] forIndexPath:indexPath];
        [cell updateDto:dto];
        return cell;
    }
    return nil;
}

- (void)parseOpDto:(NSDictionary *)dict dataList:(NSMutableArray *)dataList {
    [dataList addObject:[MCAdvertisementDto createDto:dict]];
}


@end
