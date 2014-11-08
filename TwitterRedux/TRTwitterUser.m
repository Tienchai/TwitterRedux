//
//  TRTwitterUser.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/1/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRTwitterUser.h"

@implementation TRTwitterUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{@"ID": @"id_str",
           @"name": @"name",
           @"screenname": @"screen_name",
           @"profileImageUrl": @"profile_image_url_https",
           @"tagline": @"description",
           @"tweetsCount": @"statuses_count",
           @"followingsCount": @"friends_count",
           @"followersCount": @"followers_count",
           };
}

+ (NSValueTransformer *)profileImageUrlJSONTransformer {
  return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

#pragma mark - Current user

static TRTwitterUser *_currentUser;
static NSString *kCurrentUserKey = @"kCurrentUserKey";

+ (TRTwitterUser *)currentUser {
  if (!_currentUser) {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kCurrentUserKey];
    if (data) {
      _currentUser = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
  }

  return _currentUser;
}

+ (void)setCurrentUser:(TRTwitterUser *)currentUser {
  _currentUser = currentUser;
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:_currentUser] forKey:kCurrentUserKey];
  [defaults synchronize];
}

@end
