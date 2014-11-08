//
//  TRTwitterClient.h
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/1/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "TRTwitterUser.h"
#import "TRTwitterTweet.h"

typedef void(^TwitterClientOAuthSuccessCallback)(TRTwitterUser *user);
typedef void(^TwitterClientCallbackWithTweet)(TRTwitterTweet *tweet);
typedef void(^TwitterClientCallbackWithTweets)(NSArray *tweet);
typedef void(^TwitterClientFailureCallback)(NSError *error);

@interface TRTwitterClient : BDBOAuth1RequestOperationManager

+ (TRTwitterClient *)sharedInstance;
+ (BOOL)openURL:(NSURL *)url;

- (void)loginWithSuccess:(TwitterClientOAuthSuccessCallback)success failure:(TwitterClientFailureCallback)failure;

- (void)getHomeTimelineWithSuccess:(TwitterClientCallbackWithTweets)success failure:(TwitterClientFailureCallback)failure;
- (void)getMentionTimelineWithSuccess:(TwitterClientCallbackWithTweets)success failure:(TwitterClientFailureCallback)failure;

- (void)postStatusUpdateWithStatus:(NSString *)status success:(TwitterClientCallbackWithTweet)success failure:(TwitterClientFailureCallback)failure;
- (void)postDeleteStatusWithTweet:(TRTwitterTweet *)tweet success:(TwitterClientCallbackWithTweet)success failure:(TwitterClientFailureCallback)failure;
- (void)postRetweetWithTweet:(TRTwitterTweet *)tweet success:(TwitterClientCallbackWithTweet)success failure:(TwitterClientFailureCallback)failure;
- (void)postFavouriteWithTweet:(TRTwitterTweet *)tweet success:(TwitterClientCallbackWithTweet)success failure:(TwitterClientFailureCallback)failure;
- (void)postUnfavouriteWithTweet:(TRTwitterTweet *)tweet success:(TwitterClientCallbackWithTweet)success failure:(TwitterClientFailureCallback)failure;

@end
