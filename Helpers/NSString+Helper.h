//
//  NSString+Helper.h
//  iTVDb
//
//  Created by Kevin Tuhumury on 7/10/12.
//  Copyright (c) 2012 Thmry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

+ (NSArray *)stringToArray:(NSString *)string;
+ (NSDate *)stringToDate:(NSString *)string;

@end