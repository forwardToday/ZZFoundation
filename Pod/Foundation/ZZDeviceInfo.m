//
//  BBDeviceInfo.m
//  BBDuoBao
//
//  Created by zz on 15/12/1.
//  Copyright © 2015年 bobo. All rights reserved.
//

#import "ZZDeviceInfo.h"

@implementation ZZDeviceInfo

+ (NSString *)deviceName
{
    return [UIDevice currentDevice].name;
}

+ (NSString *)deviceModel
{
    return [UIDevice currentDevice].model;
}

+ (NSString *)deviceLocalizedModel
{
    return [UIDevice currentDevice].localizedModel;
}

+ (NSString *)deviceSystemName
{
    return [UIDevice currentDevice].systemName;
}


+ (NSString *)deviceSystemVersion
{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)deviceIdentifier
{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}


@end
