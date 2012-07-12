//
//  TVDbShow.h
//  iTVDb
//
//  Created by Kevin Tuhumury on 7/10/12.
//  Copyright (c) 2012 Thmry. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TVDbClient, TVDbEpisode, TVDbImage, XMLReader;

@interface TVDbShow : NSObject

// basic properties of a show

@property (nonatomic, retain) NSNumber *showId;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *banner;
@property (nonatomic, retain) NSString *bannerThumbnail;
@property (nonatomic, retain) NSString *imdbId;
@property (nonatomic, retain) NSDate   *premiereDate;

// extra properties of a show

@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSArray *genre;
@property (nonatomic, retain) NSArray *actors;
@property (nonatomic, retain) NSString *poster;
@property (nonatomic, retain) NSString *posterThumbnail;
@property (nonatomic, retain) NSString *airDay;
@property (nonatomic, retain) NSString *airTime;
@property (nonatomic, retain) NSString *runtime;
@property (nonatomic, retain) NSString *network;
@property (nonatomic, retain) NSString *contentRating;
@property (nonatomic, retain) NSNumber *rating;

+ (NSMutableArray *)findByName:(NSString *)name;
+ (TVDbShow *)findById:(NSNumber *)showId;
+ (NSMutableArray *)findEpisodesByShowId:(NSNumber *)showId;

- (TVDbShow *)initWithDictionary:(NSDictionary *)dictionary;

@end