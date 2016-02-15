//
//  NSMutableAttributedString+colorFigure.m
//  BBDuoBao
//
//  Created by zz on 15/11/28.
//  Copyright © 2015年 bobo. All rights reserved.
//

#import "NSMutableAttributedString+colorFigure.h"

@implementation NSMutableAttributedString (colorFigure)

- (instancetype)initWithString:(NSString *)string figure:(NSInteger)figure figureColor:(UIColor *)figureColor
{
    self = [super init];
    if (self) {
        NSString *countString = [NSString stringWithFormat:@"%ld",(long)figure];
        self = [[NSMutableAttributedString alloc] initWithString:string];
        NSRange range = [string rangeOfString:countString];
        [self addAttribute:NSForegroundColorAttributeName
                            value:(id)figureColor.CGColor
                            range:range];
    }
    return self;
}

+ (instancetype)attributedStringWithString:(NSString *)string figure:(NSInteger)figure figureColor:(UIColor *)figureColor
{
    return [[self alloc] initWithString:string
                                 figure:figure
                            figureColor:figureColor];
}


- (instancetype)initWithString:(NSString *)string colorString:(NSString *)colorString Color:(UIColor *)color
{
    self = [super init];
    if (self) {
        self = [[NSMutableAttributedString alloc] initWithString:string];
        NSRange range = [string rangeOfString:colorString];
        [self addAttribute:NSForegroundColorAttributeName
                            value:(id)color.CGColor
                            range:range];
    }
    return self;
}

+ (instancetype)attributedStringWithString:(NSString *)string colorString:(NSString *)colorString Color:(UIColor *)color
{
    return [[self alloc] initWithString:string
                            colorString:colorString
                                  Color:color];
}

@end
