//
//  NSMutableAttributedString+colorFigure.h
//  BBDuoBao
//
//  Created by zz on 15/11/28.
//  Copyright © 2015年 bobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (colorFigure)

- (instancetype)initWithString:(NSString *)string colorString:(NSString *)colorString Color:(UIColor *)color;
+ (instancetype)attributedStringWithString:(NSString *)string colorString:(NSString *)colorString Color:(UIColor *)color;

- (instancetype)initWithString:(NSString *)string figure:(NSInteger)figure figureColor:(UIColor *)figureColor;
+ (instancetype)attributedStringWithString:(NSString *)string figure:(NSInteger)figure figureColor:(UIColor *)figureColor;


@end
