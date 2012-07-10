# iTVDb (TheTVDB)

These Objective-C classes provide a wrapper around the [TVDB](http://thetvdb.com) XML API and can be used in iOS apps. These classes are Objective-C ARC (Automatic Reference Counting), so you'll need to enable ARC in XCode when setting up a new project. ARC is supported in iOS 4.0 and above, but you'll need to use the iOS 5.x SDK.

## Installation

For now just copy over the files in this repository to your project.

## Usage

An API key is needed to use the iTVDb wrapper in your iOS app, except for one call: `findByName:`, which technically can be called without one. The following will show you how to retrieve all the TV shows that match 'Game of Thrones':

    NSMutableArray *shows = [TVDbShow findByName:@"Game of Thrones"];

This will internally retrieve an XML file from the TVDB API, convert it to a NSDictionary and load it into a TVDbShow object, which in turn will be added to the NSMutableArray called `shows`. The data retrieved from this call is some basic information about the TV show.

If you want more detailed information, an API key is needed. Since this has to be retrieved with another API call. The NSMutableArray `shows` can contain multiple TVDbShow instances, but in this case it's a single object. The following properties can be accessed from the TVDbShow instance:

    show.showId           // 121361
    show.premiereDate     // 2011-04-17
    show.imdbId           // tt0944947
    show.description      // Based on the fantasy novel series "A Song of Ice and Fire," Game of Thrones explores the story of an epic battle among seven kingdoms and two ruling families in the only game that matters - the Game of Thrones. All seek control of the Iron Throne, the possession of which ensures survival through the 40-year winter to come.
    show.title            // Game of Thrones
    show.banner           // http://www.thetvdb.com/api/banners/graphical/121361-g19.jpg
    show.bannerThumbnail  // http://www.thetvdb.com/api/banners/_cache/graphical/121361-g19.jpg

As mentioned above, all API calls except for `findByName:` on the `TVDbShow` class need an API key. An API key can be retrieved by [registering](http://thetvdb.com/?tab=apiregister) for one on the TVDB website. Once you have an API key, you'll be able to use the other methods.

To retrieve the detailed information of 'Game of Thrones', the `showId` from the previous API call is needed. Below is an example of retrieving such information and setting your API key.

    [[TVDbClient sharedInstance] setApiKey: @"YOUR API KEY"];
    TVDbShow *show = [TVDbShow findById:[NSNumber numberWithInt:121361]];

The properties of `show` include all of the above and in addition to that, the following:

    show.status          // Continuing
    show.genre           // ["Action and Adventure", "Drama", "Fantasy"]
    show.actors          // ["Peter Dinklage", "Kit Harington", "Emilia Clarke", ...]
    show.airDay          // Sunday
    show.airTime         // 9:00 PM
    show.runtime         // 60
    show.network         // HBO
    show.contentRating   // TV-MA
    show.poster          // http://www.thetvdb.com/api/banners/posters/121361-13.jpg
    show.posterThumbnail // http://www.thetvdb.com/api/banners/_cache/posters/121361-13.jpg

## Notice!

The TVDB XML API hasn't been completely covered yet. Right now, it includes the above. So, obviously it's a WIP.

## Credit where credit is due

iTVDb uses the [XML-to-NSDictionary](https://github.com/bcaccinolo/XML-to-NSDictionary) library by bcaccinolo to convert the retrieved XML into a NSDictionary.

## Contributing

You're very welcome to contribute to this project. To do so, follow these steps:

1. Fork this project
2. Clone your fork on your local machine
3. Create your feature branch with `git checkout -b my-new-feature`
4. Add the actual new feature
5. Commit your changes `git commit -am 'Added new feature'`
6. Push to your branch `git push origin my-new-feature`
7. Create a new Pull Request

## Copyright

Copyright 2012 Kevin Tuhumury. Released under the MIT License.
