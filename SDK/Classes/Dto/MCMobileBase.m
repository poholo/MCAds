//
// Created by majiancheng on 16/6/28.
// Copyright (c) 2016 poholo. All rights reserved.
//
#import "MCMobileBase.h"

#import <CoreLocation/CoreLocation.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

#import "MCAdDef.h"

@implementation MCMobileBase

- (instancetype)init {
    self = [super init];
    if (self) {
        if ([CLLocationManager locationServicesEnabled] &&
                ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized
                        || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)) {
            //定位功能可用，开始定位
            [self initializeLocationService];
            self.locale = [[NSLocale currentLocale] objectForKey:NSLocaleIdentifier];
            self.country = [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
            self.orientation = 1;
            CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
            CTCarrier *carrier = [netinfo subscriberCellularProvider];
            self.Carrier = [carrier carrierName];
        } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
            //定位功能不可用，提示用户或忽略
        }
    }
    return self;

}

- (void)initializeLocationService {
    // 初始化定位管理器
    _locationManager = [[CLLocationManager alloc] init];
    // 设置代理
    _locationManager.delegate = self;
    // 设置定位精确度到米
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // 设置过滤器为无
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    // 开始定位
    [_locationManager requestAlwaysAuthorization];//这句话ios8以上版本使用。
    [_locationManager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:
            (CLLocation *)newLocation
           fromLocation:
                   (CLLocation *)oldLocation {
//将经度显示到label上
    self.longitude = [NSString stringWithFormat:@"%lf", newLocation.coordinate.longitude];
    //将纬度现实到label上
    self.latitude = [NSString stringWithFormat:@"%lf", newLocation.coordinate.latitude];
    // 获取当前所在的城市名
    [manager stopUpdatingLocation];

    _isUploadLocationInfo = YES;
    if (_isUploadLocationInfo) {
        return;
    }
    // 保存 Device 的现语言 (英语 法语 ，，，)
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSMutableArray *userDefaultLanguages = [userDefaults objectForKey:@"AppleLanguages"];
//
//    // 强制 成 简体中文
//    [[NSUserDefaults standardUserDefaults] setObject:@[@"en-US"]
//                                              forKey:@"AppleLanguages"];
//    [userDefaults synchronize];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];

    //根据经纬度反向地理编译出地址信息
    __weak typeof(self) weakSelf = self;
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (array.count > 0) {
            CLPlacemark *placemark = array[0];
            //将获得的所有信息显示到label上
            strongSelf.location = placemark.name;
            //获取城市
            NSString *city = placemark.locality;
            if (!city) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
                // 还原Device 的语言
            }

            MCLog(@"city = %@", city);
            if (city && CFStringTransform((__bridge CFMutableStringRef) city, 0, kCFStringTransformStripDiacritics, NO)) {
                strongSelf.city = city;
            } else {
                strongSelf.city = @"";
            }
        } else if (error == nil && [array count] == 0) {
            MCLog(@"No results were returned.");
        } else if (error != nil) {
            MCLog(@"An error occurred = %@", error);
        }

//        [userDefaults setObject:userDefaultLanguages forKey:@"AppleLanguages"];
//        [userDefaults synchronize];
    }];

}
@end
