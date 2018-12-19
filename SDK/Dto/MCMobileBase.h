//
// Created by majiancheng on 16/6/28.
// Copyright (c) 2016 poholo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

@protocol CLLocationManagerDelegate;


@interface MCMobileBase : NSObject<CLLocationManagerDelegate> {
    CLLocationManager *_locationManager;
    BOOL               _isUploadLocationInfo;
}
@property (nonatomic, copy)NSString *longitude;
@property (nonatomic, copy)NSString *latitude;
@property (nonatomic, copy)NSString *city;
@property (nonatomic, copy)NSString *location;
@property (nonatomic, copy)NSString *locale;
@property (nonatomic, copy)NSString *country;
@property (nonatomic, copy)NSString *Carrier;
@property (nonatomic, assign)NSInteger orientation;
@end