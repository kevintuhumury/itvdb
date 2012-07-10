//
//  TVDbClient.h
//  iTVDb
//
//  Created by Kevin Tuhumury on 7/10/12.
//  Copyright (c) 2012 Thmry. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BASE_URI @"http://www.thetvdb.com/api/"

@class XMLReader;

@interface TVDbClient : NSObject
{
    NSString *_apiKey;
    NSString *_language;
}

@property (nonatomic, retain) NSString *apiKey;
@property (nonatomic, retain) NSString *language;

+ (TVDbClient *)sharedInstance;

- (NSDictionary *)requestURL:(NSString *)url;

@end