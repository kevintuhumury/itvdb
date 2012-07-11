//
//  TVDbEpisode.m
//  iTVDb
//
//  Created by Kevin Tuhumury on 7/10/12.
//  Copyright (c) 2012 Thmry. All rights reserved.
//

#import "TVDbEpisode.h"
#import "TVDbClient.h"

@interface TVDbEpisode()

+ (NSString *)episodesUrl:(NSNumber *)showId;

@end


@implementation TVDbEpisode

@synthesize episodeId, title, description, seasonNumber, episodeNumber, banner, bannerThumbnail, writer, director, gueststars, imdbId, premiereDate, rating;

#pragma mark - class methods

+ (TVDbEpisode *)findById:(NSNumber *)episodeId
{
    // TODO
}

+ (TVDbEpisode *)findByShowId:(NSNumber *)showId seasonNumber:(NSNumber *)seasonNumber episodeNumber:(NSNumber *)episodeNumber
{
    // TODO
}

#pragma mark - internal methods

+ (NSString *)episodesUrl:(NSNumber *)showId
{
    return [[[TVDbClient sharedInstance] apiKey] stringByAppendingString: [NSString stringWithFormat: @"/series/%@/all/", showId]];
}

@end
