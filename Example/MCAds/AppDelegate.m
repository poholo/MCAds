//
//  AppDelegate.m
//  MCAds
//
//  Created by majiancheng on 2018/12/18.
//  Copyright © 2018 majiancheng. All rights reserved.
//

#import "AppDelegate.h"
#import "MCAdsManager.h"
#import "MCSplashService.h"
#import "MCApiConfig.h"
#import "MCColorConfig.h"
#import "MCFontConfig.h"
#import "MCStyleConfig.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //--------api 数据传输部分必须实现-----------//

    __weak typeof(self) weakSelf = self;
    [MCAdsManager share].apiConfig.apiAdConfigMaterialCallBack = ^NSDictionary *(void) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"AdInfos_Baidu" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSError *error;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        NSDictionary *dealDict = @{DATA_SUCCESS: @(error ? NO : YES), DATA_DICT: dictionary};
        return dealDict;
    };

    [MCAdsManager share].apiConfig.apiAdConfigMaterialSourceTypeCallBack = ^NSDictionary *(MCAdSourceType type) {
        __strong typeof(weakSelf) strongself = weakSelf;
        NSString *path = [strongself adSourceFileOfType:type];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSError *error;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        NSDictionary *dealDict = @{DATA_SUCCESS: @(error ? NO : YES), DATA_DICT: dictionary};
        return dealDict;
    };

    [MCAdsManager share].apiConfig.apiReqCustomAdsCallBack = ^NSDictionary *(NSInteger num) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"DataFlow_Custom_Ads" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSError *error;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        NSDictionary *dealDict = @{DATA_SUCCESS: @(error ? NO : YES), DATA_DICT: dictionary};
        return dealDict;
    };

    //----------------Color------------------------------------//
//    [MCAdsManager share].colorConfig.colorI = ...
//    [MCAdsManager share].colorConfig.color... = ...
    //-----------------Font-------------------------//
//    [MCAdsManager share].fontConfig.fontI = ...

    //------------------Style----------------------------//
//    [MCAdsManager share].styleConfig.contentInset = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(5, 12, 5, 12)];

    [[MCAdsManager share] loadConfig];
    [[MCAdsManager share].splashService showSplash];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release share resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSString *)adSourceFileOfType:(MCAdSourceType)sourceType {
    NSString *fileName = nil;
    switch (sourceType) {
        case MCAdSourceBaidu: {
            fileName = @"AdInfos_Baidu.json";
        }
            break;
        case MCAdSourceTencent: {
            fileName = @"AdInfos_GDT.json";
        }
            break;
        case MCAdSourceInmmobi: {
            fileName = @"AdInfos_Custom.json";
        }
            break;
        case MCAdSourceCustom: {
            fileName = @"AdInfos_Custom.json";
        }
            break;
    }
    return [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
}

@end
