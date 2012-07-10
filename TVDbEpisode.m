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

+ (NSString *)episodesUrl:(NSNumber *)showId
{
    return [[[TVDbClient sharedInstance] apiKey] stringByAppendingString: [NSString stringWithFormat: @"/series/%@/all/", showId]];
}

@end
