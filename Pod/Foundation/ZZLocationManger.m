//
//  ZZLocationManger.m
//  MBoBo
//
//  Created by zz on 16/2/15.
//  Copyright © 2016年 bobo. All rights reserved.
//

#import "ZZLocationManger.h"

static CLLocationManager *shareLocationManager = nil;
@interface ZZLocationManger ()<CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (copy, nonatomic) ZZLocationServiceCompleteBlock locationBlock;
@property (copy, nonatomic) ZZLocationServiceCityBlock cityBlock;
@end

@implementation ZZLocationManger

#pragma mark - public methods

- (void)startLocationServiceWithCompleteBlock:(ZZLocationServiceCompleteBlock)locationBlock
{
    self.locationBlock = locationBlock;
    [self startLocation];
}

- (void)startLocationServiceWithCompleteCityBlock:(ZZLocationServiceCityBlock)cityBlock
{
    self.cityBlock = cityBlock;
    [self startLocation];
}

- (void)stopLocationService
{
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - private methods

- (void)startLocation
{
    if([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [ZZLocationManger shareLocationManager];
        self.locationManager.delegate = self;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
            [self.locationManager requestWhenInUseAuthorization];  //调用了这句,就会弹出允许框了.
        }
        [self.locationManager startUpdatingLocation];
    }else {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"定位不成功 ,请确认开启定位" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

- (void)reverseGeocodeCityWith:(CLLocation *)location
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *array, NSError *error){
        if (array.count > 0){
            CLPlacemark *placemark = [array objectAtIndex:0];
            NSString *city = placemark.locality;
            if (!city) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
            }
            self.cityBlock(city, nil);
        }else if (error == nil && [array count] == 0) {
            NSLog(@"No results were returned.");
        }else if (error != nil) {
            NSLog(@"An error occurred = %@", error);
        }
    }];
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - CoreLocation Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *currentLocation = [locations lastObject];
    if (self.locationBlock) {
        self.locationBlock(currentLocation,nil);
        return;
    }
    
    if (self.cityBlock) {
        [self reverseGeocodeCityWith:currentLocation];
        return;
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    if (error.code == kCLErrorDenied) {
        if (self.cityBlock) {
            self.cityBlock(nil, error);
        }
        
        if (self.locationBlock) {
            self.locationBlock(nil, error);
        }
    }
}

#pragma mark - shareInstance

+ (CLLocationManager *)shareLocationManager
{
    if (!shareLocationManager) {
        shareLocationManager = [[CLLocationManager alloc] init];
    }
    return shareLocationManager;
}

@end