//
//  TVDbEpisode.m
//  iTVDb
//
//  Created by Kevin Tuhumury on 7/10/12.
//  Copyright (c) 2012 Thmry. All rights reserved.
//

#import "TVDbEpisode.h"
#import "TVDbClient.h"
#import "TVDbImage.h"

#import "XMLReader.h"
#import "NSString+Helper.h"

@interface TVDbEpisode()

+ (NSString *)episodesUrl:(NSNumber *)showId;

@end


@implementation TVDbEpisode

@synthesize episodeId, title, description, seasonNumber, episodeNumber, banner, bannerThumbnail, writer, director, gueststars, imdbId, premiereDate, rating;

#pragma mark - initializers

- (TVDbEpisode *)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        self.episodeId       = [NSNumber numberWithInt:[[dictionary retrieveForPath:@"id"] intValue]];
        self.title           = [dictionary retrieveForPath:@"EpisodeName"];
        self.description     = [dictionary retrieveForPath:@"Overview"];
        self.seasonNumber    = [NSNumber numberWithInt:[[dictionary retrieveForPath:@"SeasonNumber"] intValue]];
        self.episodeNumber   = [NSNumber numberWithInt:[[dictionary retrieveForPath:@"EpisodeNumber"] intValue]];
        
        if ([dictionary retrieveForPath:@"filename"])
        {
            TVDbImage *bannerImage = [[TVDbImage alloc] initWithUrl:[dictionary retrieveForPath:@"filename"]];
            
            self.banner            = [bannerImage url];
            self.bannerThumbnail   = [bannerImage thumbnailUrl];
        }
        
        self.writer          = [NSString stringToArray:[dictionary retrieveForPath:@"Writer"]];
        self.director        = [NSString stringToArray:[dictionary retrieveForPath:@"Director"]];
        self.gueststars      = [NSString stringToArray:[dictionary retrieveForPath:@"GuestStars"]];
        self.imdbId          = [dictionary retrieveForPath:@"IMDB_ID"];
        self.premiereDate    = [NSString stringToDate:[dictionary retrieveForPath:@"FirstAired"]];
        self.rating          = [dictionary retrieveForPath:@"Rating"];
    }
    return self;
}

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
