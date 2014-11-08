//
//  TRTwitterTweet.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/1/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRTwitterTweet.h"

@implementation TRTwitterTweet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{@"ID": @"id_str",
           @"text": @"text",
           @"createdTime": @"created_at",
           @"author": @"user",
           @"retweetCount": @"retweet_count",
           @"favouritesCount": @"favourites_count",
           @"retweeted": @"retweeted",
           @"favourited": @"favorited"};
}

+ (NSDateFormatter *)dateFormatter {
  static NSDateFormatter *dateFormatter;
  static dispatch_once_t once;
  dispatch_once(&once, ^{
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
  });
  return dateFormatter;
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
  return [MTLValueTransformer reversibleTransformerWithForwardBlock:^NSDate *(NSString *dateString) {
    return [[self dateFormatter] dateFromString:dateString];
  } reverseBlock:^NSString *(NSDate *date) {
    return [[self dateFormatter] stringFromDate:date];
  }];
}

+ (NSValueTransformer *)authorJSONTransformer {
  return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:TRTwitterUser.class];
}

//+ (NSValueTransformer *)retweetCountJSONTransformer {
//
//}

//- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
//  if (self = [super init]) {
//    _ID = [dictionary valueForKey:@"id_str"];
//    _text = [dictionary valueForKey:@"text"];
//    _createdTime = [self _parseDate:[dictionary valueForKey:@"created_at"]];
//    _author = [TRTwitterUser modelWithDictionary:[dictionary valueForKey:@"user"] error:NULL];
//    _retweetCount = [[dictionary valueForKey:@"retweet_count"] unsignedIntegerValue];
//    _favouritesCount = [[dictionary valueForKey:@"favourites_count"] unsignedIntegerValue];
//    _retweeted = [[dictionary valueForKey:@"retweeted"] boolValue];
//    _favourited = [[dictionary valueForKey:@"favorited"] boolValue];
//  }
//  return self;
//}

@end
