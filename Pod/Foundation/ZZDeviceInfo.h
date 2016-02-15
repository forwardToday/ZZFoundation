//
//  BBDeviceInfo.h
//  BBDuoBao
//
//  Created by zz on 15/12/1.
//  Copyright © 2015年 bobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZDeviceInfo : NSObject

/**
 *  设备持有人
 */
+ (NSString *)deviceName;

/**
 *  @"iPhone", @"iPod touch"
 */
+ (NSString *)deviceModel;

/**
 *  localized version of model
 */
+ (NSString *)deviceLocalizedModel;

/**
 *  iOS OSx
 */
+ (NSString *)deviceSystemName; 

/**
 * ios 9.0
 */
+ (NSString *)deviceSystemVersion;

/**
 *  identifier
 */
+ (NSString *)deviceIdentifier;

@end

