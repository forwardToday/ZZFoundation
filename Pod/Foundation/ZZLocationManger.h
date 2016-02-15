//
//  ZZLocationManger.h
//  MBoBo
//
//  Created by zz on 16/2/15.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

//在info.plist加上NSLocationWhenInUseUsageDescription字段定制提示信息内容
typedef void (^ZZLocationServiceCompleteBlock)(CLLocation *location, NSError *error);
typedef void (^ZZLocationServiceCityBlock)(NSString *cityName, NSError *error);
@interface ZZLocationManger : NSObject
/**
 *  定位获得CLLocation，持续定位。不需要定位时，需要调用stopLocationService关闭定位
 */
- (void)startLocationServiceWithCompleteBlock:(ZZLocationServiceCompleteBlock)locationBlock;

/**
 *  定位获得城市名字，不需要调用stopLocationService关闭定位
 */
- (void)startLocationServiceWithCompleteCityBlock:(ZZLocationServiceCityBlock)cityBlock;

/**
 *  关闭定位,防止消耗电量
 */
- (void)stopLocationService;


@end
