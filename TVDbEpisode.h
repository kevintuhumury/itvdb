//
//  TVDbEpisode.h
//  iTVDb
//
//  Created by Kevin Tuhumury on 7/10/12.
//  Copyright (c) 2012 Thmry. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TVDbClient, XMLReader;

@interface TVDbEpisode : NSObject

@property (nonatomic, retain) NSNumber *episodeId;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSNumber *seasonNumber;
@property (nonatomic, retain) NSNumber *episodeNumber;
@property (nonatomic, retain) NSString *banner;
@property (nonatomic, retain) NSString *bannerThumbnail;
@property (nonatomic, retain) NSArray  *writer;
@property (nonatomic, retain) NSArray  *director;
@property (nonatomic, retain) NSArray  *gueststars;
@property (nonatomic, retain) NSString *imdbId;
@property (nonatomic, retain) NSDate   *premiereDate;
@property (nonatomic, retain) NSNumber *rating;
@property (nonatomic, retain) NSNumber *showId;

+ (TVDbEpisode *)findById:(NSNumber *)episodeId;
+ (TVDbEpisode *)findByShowId:(NSNumber *)showId seasonNumber:(NSNumber *)seasonNumber episodeNumber:(NSNumber *)episodeNumber;

- (TVDbEpisode *)initWithDictionary:(NSDictionary *)dictionary;

@end