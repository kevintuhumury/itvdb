//
//  NSString+Helper.m
//  iTVDb
//
//  Created by Kevin Tuhumury on 7/10/12.
//  Copyright (c) 2012 Thmry. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

+ (NSArray *)stringToArray:(NSString *)string
{
    return [[string substringWithRange: NSMakeRange(1, [string length] - 2)] componentsSeparatedByString: @"|"];
}

+ (NSDate *)stringToDate:(NSString *)string
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter dateFromString:string];
}

@end