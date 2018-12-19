//
// Created by majiancheng on 2017/5/23.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "NSObject+Ad.h"

#import "MCAdDto.h"
#import "MCAdLittleImageCell.h"
#import "MCAdBigImageCell.h"
#import "MCAdOrientionImageCell.h"
#import "MCAdMutipleImageCell.h"
#import "MCAdContinuePlayCollectionCell.h"
#import "MCAdCollectionBaseCell.h"
#import "MCMobileSSP.h"
#import "MCDto.h"
#import "MCOpAdCell.h"
#import "MCAdvertisementDto.h"
#import "MCSnapAdCell.h"
#import "MCH5AdDto.h"
#import "MCTapTableCell.h"

@implementation NSObject (Ad)

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

- (CGFloat)adSuiltHeight:(AdDisplayStyleType)type {
    switch (type) {
        case AdDisplayStyleLittle      : {
            return [MCAdLittleImageCell height];
        }
            break;///< 小图模式
        case AdDisplayStyleBig         : {
            return [MCAdBigImageCell height];
        }
            break;///< 大图模式
        case AdDisplayStyleOriention   : {
            return [MCAdOrientionImageCell height];
        }
            break;///< 横幅模式
        case AdDisplayStyleMutiple     : {
            return [MCAdMutipleImageCell height];
        }
            break;///< 多图模式
        case AdDisplayStyleContinuePlay : {
            // not need
        }
            break;///< 联播模式
        case AdDisplayStyleCollection: {

        }
            break;
        case AdDisplayStyleCollectionH5: {
        }
            break;
    }
    return [MCAdLittleImageCell height];
}

- (MCAdBaseCell *)adSuiltCell:(AdDisplayStyleType)type
                    container:(UIScrollView *)container
                    indexPath:(NSIndexPath *)indexPath
                        adDto:(MCAdDto *)adDto
                        refer:(NSString *)refer {

    MCAdBaseCell *cell = nil;

    switch (type) {
        case AdDisplayStyleLittle      : {
            cell = [((UITableView *) container) dequeueReusableCellWithIdentifier:[MCAdLittleImageCell identifier] forIndexPath:indexPath];
        }
            break;///< 小图模式
        case AdDisplayStyleBig         : {
            cell = [(UITableView *) container dequeueReusableCellWithIdentifier:[MCAdBigImageCell identifier] forIndexPath:indexPath];
        }
            break;///< 大图模式
        case AdDisplayStyleOriention   : {
            cell = [(UITableView *) container dequeueReusableCellWithIdentifier:[MCAdOrientionImageCell identifier] forIndexPath:indexPath];
        }
            break;///< 横幅模式
        case AdDisplayStyleMutiple     : {
            cell = [(UITableView *) container dequeueReusableCellWithIdentifier:[MCAdMutipleImageCell identifier] forIndexPath:indexPath];
        }
            break;///< 多图模式
        case AdDisplayStyleContinuePlay : {

        }
            break;///< 联播模式
        case AdDisplayStyleCollection: {

        }
            break;
        case AdDisplayStyleCollectionH5: {
        }
            break;
    }

    [cell setAdPostion:indexPath];
    [cell setAdModel:adDto];
    [cell setAdRefer:nil];
    [cell trackImpression];

    return cell;
}

- (CGSize)adCollectionViewSuiltHeight:(AdDisplayStyleType)type {
    switch (type) {
        case AdDisplayStyleLittle      : {
        }
            break;///< 小图模式
        case AdDisplayStyleBig         : {
        }
            break;///< 大图模式
        case AdDisplayStyleOriention   : {
        }
            break;///< 横幅模式
        case AdDisplayStyleMutiple     : {
        }
            break;///< 多图模式
        case AdDisplayStyleContinuePlay : {
            return [MCAdContinuePlayCollectionCell size];
        }
            break;///< 联播模式
        case AdDisplayStyleCollection: {
            return [MCSnapAdCell size];
        }
            break;
        case AdDisplayStyleCollectionH5: {
        }
            break;
    }
    return CGSizeZero;
}

- (MCAdCollectionBaseCell *)adSuiltCollectionViewCell:(AdDisplayStyleType)type
                                            container:(UIScrollView *)container
                                            indexPath:(NSIndexPath *)indexPath
                                                adDto:(MCDto *)adDto
                                                refer:(NSString *)refer {
    MCAdCollectionBaseCell *cell = nil;

    switch (type) {
        case AdDisplayStyleLittle      : {
        }
            break;///< 小图模式
        case AdDisplayStyleBig         : {
        }
            break;///< 大图模式
        case AdDisplayStyleOriention   : {
        }
            break;///< 横幅模式
        case AdDisplayStyleMutiple     : {
        }
            break;///< 多图模式
        case AdDisplayStyleContinuePlay : {
            cell = [(UICollectionView *) container dequeueReusableCellWithReuseIdentifier:[MCAdContinuePlayCollectionCell identifier] forIndexPath:indexPath];
        }
            break;///< 联播模式
        case AdDisplayStyleCollection: {
            cell = [(UICollectionView *) container dequeueReusableCellWithReuseIdentifier:[MCSnapAdCell identifier] forIndexPath:indexPath];
        }
            break;
        case AdDisplayStyleCollectionH5: {
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


- (MCTapTableCell *)adOpSuitCell:(MCDto *)dto container:(UIScrollView *)container indexPath:(NSIndexPath *)indexPath refer:(NSString *)refer {
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
