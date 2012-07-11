//
//  TVDbShow.m
//  iTVDb
//
//  Created by Kevin Tuhumury on 7/10/12.
//  Copyright (c) 2012 Thmry. All rights reserved.
//

#import "TVDbShow.h"
#import "TVDbClient.h"
#import "TVDbImage.h"

#import "XMLReader.h"
#import "NSString+Helper.h"

@interface TVDbShow()

+ (void)buildShowWithDictionary:(NSDictionary *)dictionary reference:(NSMutableArray **)reference;
+ (NSString *)searchTermUrl:(NSString *)term;
+ (NSString *)searchTerm:(NSString *)term;
+ (NSString *)showUrl:(NSNumber *)showId;

@end


@implementation TVDbShow

@synthesize showId, title, description, banner, bannerThumbnail, imdbId, premiereDate;
@synthesize status, genre, actors, poster, posterThumbnail, airDay, airTime, runtime, network, contentRating, rating;

#pragma mark - initializers

- (TVDbShow *)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        // properties retrieved by a basic search request
        
        self.showId          = [NSNumber numberWithInt:[[dictionary retrieveForPath:@"id"] intValue]];
        self.title           = [dictionary retrieveForPath:@"SeriesName"];
        self.description     = [dictionary retrieveForPath:@"Overview"];
        self.imdbId          = [dictionary retrieveForPath:@"IMDB_ID"];
        self.premiereDate    = [NSString stringToDate:[dictionary retrieveForPath:@"FirstAired"]];
        
        if ([dictionary retrieveForPath:@"banner"])
        {
            TVDbImage *bannerImage = [[TVDbImage alloc] initWithUrl:[dictionary retrieveForPath:@"banner"]];
            
            self.banner          = [bannerImage url];
            self.bannerThumbnail = [bannerImage thumbnailUrl];
        }
        
        // properties retrieved by a detailed series search request
        
        self.status          = [dictionary retrieveForPath:@"Status"];
        self.genre           = [NSString stringToArray:[dictionary retrieveForPath:@"Genre"]];
        self.actors          = [NSString stringToArray:[dictionary retrieveForPath:@"Actors"]];
        self.airDay          = [dictionary retrieveForPath:@"Airs_DayOfWeek"];
        self.airTime         = [dictionary retrieveForPath:@"Airs_Time"];
        self.runtime         = [dictionary retrieveForPath:@"Runtime"];
        self.network         = [dictionary retrieveForPath:@"Network"];
        self.contentRating   = [dictionary retrieveForPath:@"ContentRating"];
        self.rating          = [dictionary retrieveForPath:@"Rating"];
        
        if ([dictionary retrieveForPath:@"poster"])
        {
            TVDbImage *posterImage = [[TVDbImage alloc] initWithUrl:[dictionary retrieveForPath:@"poster"]];
            
            self.poster          = [posterImage url];
            self.posterThumbnail = [posterImage thumbnailUrl];
        }
    }
    return self;
}

# pragma mark - class methods

+ (NSMutableArray *)findByName:(NSString *)name
{
    id response = [[[TVDbClient sharedInstance] requestURL:[self searchTermUrl:name]] retrieveForPath:@"Data.Series"];
    
    NSMutableArray *shows = [NSMutableArray array];
    if ([response isKindOfClass:[NSDictionary class]])
    {
        [self buildShowWithDictionary:response reference:&shows];
    }
    if ([response isKindOfClass:[NSArray class]])
    {
        for (id showDictionary in response)
        {
            [self buildShowWithDictionary:showDictionary reference:&shows];
        }
    }
    return shows;
}

+ (TVDbShow *)findById:(NSNumber *)showId
{
    NSDictionary *responseDictionary = [[TVDbClient sharedInstance] requestURL: [self showUrl:showId]];
    return [[TVDbShow alloc] initWithDictionary: [responseDictionary retrieveForPath:@"Data.Series"]];
}

+ (NSMutableArray *)findEpisodesByShowId:(NSNumber *)showId
{
    // TODO
}

# pragma mark - internal methods

+ (void)buildShowWithDictionary:(NSDictionary *)dictionary reference:(NSMutableArray **)reference
{
    TVDbShow * show = [[TVDbShow alloc] initWithDictionary:dictionary];
    [*reference addObject:show];
}

+ (NSString *)searchTermUrl:(NSString *)term
{
    return [NSString stringWithFormat: @"GetSeries.php?seriesname=%@&language=%@", [self searchTerm:term], [[TVDbClient sharedInstance] language]];
}

+ (NSString *)searchTerm:(NSString *)term
{
    return [term stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}

+ (NSString *)showUrl:(NSNumber *)showId
{
    return [[[TVDbClient sharedInstance] apiKey] stringByAppendingString: [NSString stringWithFormat: @"/series/%@", showId]];
}

@end