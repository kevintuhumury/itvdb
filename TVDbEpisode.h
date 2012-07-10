//
//  TVDbEpisode.h
//  iTVDb
//
//  Created by Kevin Tuhumury on 7/10/12.
//  Copyright (c) 2012 Thmry. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TVDbClient;

@interface TVDbEpisode : NSObject

@property (nonatomic, retain) NSNumber *episodeId;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSNumber *seasonNumber;
@property (nonatomic, retain) NSNumber *episodeNumber;
@property (nonatomic, retain) NSString *banner;
@property (nonatomic, retain) NSString *director;
@property (nonatomic, retain) NSString *writer;
@property (nonatomic, retain) NSDate   *airDate;
@property (nonatomic, retain) NSNumber *rating;
@property (nonatomic, retain) NSString *imdbId;

+ (TVDbEpisode *)findById:(NSNumber *)id;
+ (TVDbEpisode *)findByShowId:(NSNumber *)showId seasonNumber:(NSNumber *)seasonNumber EpisodeNumber:(NSNumber *)episodeNumber;

@end
